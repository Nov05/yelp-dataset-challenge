'''
Load Yelp JSON files and spit out CSV files
Does not try to reinvent the wheel and uses pandas json_normalize
Kinda hacky and requires a bit of RAM. But works, albeit naively.

Tested with Yelp JSON files in dataset challenge round 12:
https://www.yelp.com/dataset/challenge
'''

import json
from pathlib import Path
from time import clock
from typing import Dict, List

import click
import pandas as pd
from pandas.io.json import json_normalize


def read_json_as_array(json_file: Path) -> str:
    '''
    Read a given Yelp JSON file as string, adding opening / closing
    brackets and commas to convert from separate JSON objects to
    an array of JSON objects, so JSON aware libraries can properly read

    Parameters
    -----------
    json_file: path-like

    Returns
    -------
    json_data: str
        String representation of JSON array
    '''

    json_data = ''

    with open(json_file, 'r', encoding='utf-8') as in_file:
        for i, line in enumerate(in_file):
            if i == 0 and line:
                json_data += '[' + line
            elif line:
                json_data += ',' + line
            else:
                pass
        json_data += ']\n'

    return json_data


def load_json(json_data: str) -> pd.DataFrame:
    '''
    Read and normalize a given JSON array into a pandas DataFrame

    Parameters
    -----------
    json_data: str
        String representation of JSON array

    Returns
    -------
    df: pandas.DataFrame
        DataFrame containing the normalized JSON data
    '''

    data = json.loads(json_data)
    df = json_normalize(data)

    return df


def write_csv(df: pd.DataFrame, out_file: Path) -> None:
    '''
    Write a given DataFrame to csv without index

    Parameters
    -----------
    df: pandas.DataFrame
        DataFrame containing the normalized JSON data

    out_file: pathlib.Path
        A proper path of CSV file name
    '''

    df.to_csv(out_file, index=False)


@click.command()
@click.argument('json-dir', type=click.Path(exists=True, dir_okay=True))
def main(json_dir):
    '''
    Read a given directory containing Yelp JSON data and convert those
    files to CSV under 'csv_out' in the same directory
    '''
    t0 = clock()

    json_dir = Path(json_dir)
    csv_dir = json_dir / 'csv_out'
    csv_dir.mkdir(exist_ok=True)

    file_list: List[Path] = json_dir.glob('*.json')

    with click.progressbar(file_list, label='Processing files..') as bar:
        for file in bar:
            csv_file = csv_dir / (file.stem + '.csv')
            data = read_json_as_array(file)
            df = load_json(data)
            write_csv(df, csv_file)

    t1 = clock()
    mins = (t1 - t0) // 60
    secs = int((t1 - t0) % 60)
    timing = f'Conversion finished in {mins} minutes and {secs} seconds'

    click.secho(timing, fg='green')

if __name__ == '__main__':
    main()  # pylint: disable=E1120