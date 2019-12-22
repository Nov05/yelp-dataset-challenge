function multiSeriesLineChart(config) {
    function setReSizeEvent(data) {
        var resizeTimer;
        window.removeEventListener('resize', function () {
        });
        window.addEventListener('resize', function (event) {

            if (resizeTimer !== false) {
                clearTimeout(resizeTimer);
            }
            resizeTimer = setTimeout(function () {
                $(data.mainDiv).empty();
                drawmultiSeriesLineChartCharts(data);
                clearTimeout(resizeTimer);
            }, 500);
        });
    }

    drawmultiSeriesLineChartCharts(config);
    setReSizeEvent(config);
}

// create legend
function createmultiSeriesLineChartLegend(mainDiv, columnsInfo, colorRange) {
    var z = d3.scaleOrdinal()
        .range(colorRange);
    var mainDivName = mainDiv.substr(1, mainDiv.length);
    // you can adjust legend width here: 
    // e.g. $(mainDiv).width() * 0.25 
    $("#svg").after(
        "<div id='legend' class='pmd-card-body' style='margin-top:20; margin-bottom:0;\
width:" + $(mainDiv).width() * 0.25 + "; display:inline-block; vertical-align:top)'>\
</div>");
    var keys = Object.keys(columnsInfo);
    keys.forEach(function (d) {
        var cloloCode = z(d);
        $("#legend").append(
            "<span class='team-graph team1' style='display: block; margin-right:0px;'>\
<span style='background:" + cloloCode + "; width: 10px; height: 10px;\
display: inline-block; vertical-align: middle;'>&nbsp;</span>\
<span style='padding-top: 0; font-family: Source Sans Pro, sans-serif;\
font-size: 13px; display: inline;'>" + columnsInfo[d] + " </span></span>");
    });
}

function drawmultiSeriesLineChartCharts(config) {
    var keys = Object.keys(config.data[0]);
    var tempObj = {};
    keys.forEach(function (d) {
        tempObj[d] = 0;
    });
    config.data.splice(0, 0, tempObj);
    var data = config.data;
    var columnsInfo = config.columnsInfo;
    var xAxis = config.xAxis;
    var yAxis = config.yAxis;
    var colorRange = config.colorRange;
    var mainDiv = config.mainDiv;
    var mainDivName = mainDiv.substr(1, mainDiv.length);
    var label = config.label;
    var requireCircle = config.requireCircle || false;
    var requireLegend = config.requireLegend;
    // you can change the svg to main div width percentage here
    var svgWidthPercentage = 0.75
    // var imageData = config.imageData;
    d3.select(mainDiv)
        .style('display', 'inline-block')
        .style('vertical-align', 'top')
        .append('div').attr('id', 'svg')
        .attr("width", $(mainDiv).width() * svgWidthPercentage)
        .style('display', 'inline-block')
        .style('vertical-align', 'top')
        .append("svg").attr("width", $(mainDiv).width() * svgWidthPercentage)
        .attr("height", $(mainDiv).height() * 0.95)
        ;
    var svg = d3.select(mainDiv + " svg"),
        margin = { top: 20, right: 20, bottom: 30, left: 50 },
        width = svg.attr("width") - margin.left - margin.right,
        height = svg.attr("height") - margin.top - margin.bottom;
    var g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    if (requireLegend != null && requireLegend != undefined && requireLegend != false) {
        $("#legend").remove();
        createmultiSeriesLineChartLegend(mainDiv, columnsInfo, colorRange);
    }
    var x = d3.scaleLinear().range([0, width]),
        y = d3.scaleLinear().range([height, 0]),
        z = d3.scaleOrdinal()
            .range(colorRange);
    var line = d3.line()
        .x(function (d) {
            return x(d[xAxis]);
        })
        .y(function (d) {
            return y(d[yAxis]);
        });
    var columns = Object.keys(columnsInfo);
    var groupData = columns.map(function (id) {
        return {
            id: id,
            values: data.filter(function (d, i) {
                //CBT:remove last blank or value is 0 data to show only that much of line
                if ((d[id] != 0 && d[id] != null && d[id] != undefined) || i == 0) return d;
            }).map(function (d, i) {
                var tempObj = {};
                tempObj[xAxis] = d[xAxis];
                tempObj[yAxis] = d[id];
                return tempObj;
            })
        };
    });

    x.domain(d3.extent(data, function (d) {
        return d[xAxis];
    }));
    y.domain([
        d3.min(groupData, function (c) {
            return d3.min(c.values, function (d) {
                return d[yAxis];
            });
        }),
        d3.max(groupData, function (c) {
            return d3.max(c.values, function (d) {
                return d[yAxis];
            });
        })
    ]);
    z.domain(groupData.map(function (c) {
        return c.id;
    }));

    // x-axis
    g.append("g")
        .attr("class", "axis axis--x")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x))
        .append("text")
        .attr("x", width)
        .attr("y", margin.bottom * -0.2)
        .attr("text-anchor", "end")
        .attr("dx", "0.32em")
        .attr("fill", "#000")
        .attr("font-weight", "bold")
        .text(label.xAxis)
        .style("font-size","15px");
    
    // y-axis
    g.append("g")
        .attr("class", "axis axis--y")
        .call(d3.axisLeft(y))
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("text-anchor", "end")
        .attr("dy", "0.71em")
        .attr("fill", "#000")
        .attr("font-weight", "bold")
        .text(label.yAxis)
        .style("font-size","15px");

    var city = g.selectAll(".city")
        .data(groupData)
        .enter().append("g")
        .attr("class", "city");

    city.append("path")
        .attr("class", "line")
        .attr("d", function (d) {
            return line(d.values);
        })
        .style("stroke", function (d) {
            return z(d.id);
        }).style("fill", "none").style("stroke-width", "3px");

    //CBT:for wicket Circles in multiseries line chart
    var circleRadius = 6;
    var keys = Object.keys(columnsInfo);
    var element = g.append("g")
        .selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function (d) {
            return "translate(" + x(d[xAxis]) + ",0)";
        });

    var circles = element.selectAll("circle")
        .data(function (d) {
            return keys.map(function (key) {
                return { key: key, value: d[key], over: d.over };
            });
        })
        .enter().append("circle")
        .attr("cx", function (d) {
            return 0;
        })
        .attr("cy", function (d) {
            return y(d.value);
        })
        .attr("r", circleRadius)
        .attr("fill", "#fff")
        .attr("stroke", function (d) {
            if (d.circles == undefined || d.circles.length <= 0) {
                return "#fff";
            } else {
                return z(d.key);
            }
        })
        .attr("data", function (d) {
            var data = {};
            data["over"] = d.over;
            data["runs"] = d.value;
            return JSON.stringify(data);
        })
        .attr("stroke-width", "2px")
        .attr("fill-opacity", function (d) {
            return 0.05;
        })
        .attr("stroke-opacity", function (d) {
            return 0.05;
        });

    circles.on("mouseover", function () {
        var currentEl = d3.select(this);
        currentEl.attr("r", 7);
        var fadeInSpeed = 120;
        d3.select("#circletooltip_" + mainDivName)
            .transition()
            .duration(fadeInSpeed)
            .style("opacity", function () {
                return 1;
            });
        d3.select("#circletooltip_" + mainDivName).attr("transform", function (d) {
            var mouseCoords = d3.mouse(this.parentNode);
            var xCo = 0;
            if (mouseCoords[0] + 10 >= width * 0.80) {
                xCo = mouseCoords[0] - parseFloat(d3.selectAll("#circletooltipRect_" + mainDivName)
                    .attr("width"));
            } else {
                xCo = mouseCoords[0] + 10;
            }
            var x = xCo;
            var yCo = 0;
            if (mouseCoords[0] + 10 >= width * 0.80) {
                yCo = mouseCoords[1] + 10;
            } else {
                yCo = mouseCoords[1];
            }
            var x = xCo;
            var y = yCo;
            return "translate(" + x + "," + y + ")";
        });
        //CBT:calculate tooltips text
        var tooltipData = JSON.parse(currentEl.attr("data"));
        var tooltipsText = "";
        d3.selectAll("#circletooltipText_" + mainDivName).text("");
        var yPos = 0;
        d3.selectAll("#circletooltipText_" + mainDivName)
            .append("tspan")
            .attr("x", 0)
            .attr("y", yPos * 10)
            .attr("dy", "1.9em")
            .text(label.xAxis + ": " + tooltipData.over)
            ;
        yPos = yPos + 1;
        d3.selectAll("#circletooltipText_" + mainDivName)
            .append("tspan")
            .attr("x", 0)
            .attr("y", yPos * 10)
            .attr("dy", "1.9em")
            .text(label.yAxis + ": " + tooltipData.runs)
            ;
        //CBT:calculate width of the text based on characters
        var dims = helpers.getDimensions("circletooltipText_" + mainDivName);
        d3.selectAll("#circletooltipText_" + mainDivName + " tspan")
            // adjust hover text horizontal position here
            // if text-anchor: end, .attr("x", dims.w + 4)
            // if text-anchor: start, .attr("x", dims.w -42)
            .attr("x", dims.w - 42);

        d3.selectAll("#circletooltipRect_" + mainDivName)
            .attr("width", dims.w + 10)
            .attr("height", dims.h + 20);

    });
    circles.on("mousemove", function () {
        var currentEl = d3.select(this);
        currentEl.attr("r", 7);
        d3.selectAll("#circletooltip_" + mainDivName)
            .attr("transform", function (d) {
                var mouseCoords = d3.mouse(this.parentNode);
                var xCo = 0;
                if (mouseCoords[0] + 10 >= width * 0.80) {
                    xCo = mouseCoords[0] - parseFloat(d3.selectAll("#circletooltipRect_" + mainDivName)
                        .attr("width"));
                } else {
                    xCo = mouseCoords[0] + 10;
                }
                var x = xCo;
                var yCo = 0;
                if (mouseCoords[0] + 10 >= width * 0.80) {
                    yCo = mouseCoords[1] + 10;
                } else {
                    yCo = mouseCoords[1];
                }
                var x = xCo;
                var y = yCo;
                return "translate(" + x + "," + y + ")";
            });
    });
    circles.on("mouseout", function () {
        var currentEl = d3.select(this);
        currentEl.attr("r", 6);
        d3.select("#circletooltip_" + mainDivName)
            .style("opacity", function () {
                return 0;
            })
            .attr("transform", function (d, i) {
                // klutzy, but it accounts for tooltip padding which could push it onscreen
                var x = -500;
                var y = -500;
                return "translate(" + x + "," + y + ")";
            });
    });

    var circleTooltipg = g.append("g")
        .attr("font-family", "sans-serif")
        .attr("font-size", 10)
        // adjust hover text horizontal position here
        .attr("text-anchor", "start")
        .attr("id", "circletooltip_" + mainDivName)
        .attr("style", "opacity:0")
        .attr("transform", "translate(-500,-500)");

    circleTooltipg
        .append("rect")
        .attr("id", "circletooltipRect_" + mainDivName)
        .attr("x", 0)
        .attr("width", 120)
        .attr("height", 80)
        .attr("opacity", 0.71)
        .style("fill", "#000000");

    circleTooltipg
        .append("text")
        .attr("id", "circletooltipText_" + mainDivName)
        .attr("x", 15)
        .attr("y", 15)
        .attr("fill", function () {
            return "#fff"
        })
        .style("font-size", function (d) {
            return 10;
        })
        .style("font-family", function (d) {
            return "arial";
        })
        .text(function (d, i) {
            return "";
        });

}

var helpers = {
    getDimensions: function (id) {
        var el = document.getElementById(id);
        var w = 0, h = 0;
        if (el) {
            var dimensions = el.getBBox();
            w = dimensions.width;
            h = dimensions.height;
        } else {
            console.log("error: getDimensions() " + id + " not found.");
        }
        return { w: w, h: h };
    }
};