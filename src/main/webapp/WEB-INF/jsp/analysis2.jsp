<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="<%=path%>/static/js/echarts.min.js"></script>
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
</head>

<body>
<div id = "main2" style="height: 100%; width: 100%"></div>
<script type="text/javascript">
    var myecharts2 = echarts.init(document.getElementById('main2'));
    var analysisTwo = undefined;
    option2 = {
        tooltip: {
            formatter: '{a} <br/>{b} : {c}%'
        },
        toolbox: {
            feature: {
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: '业务指标',
                type: 'gauge',
                detail: {formatter: '{value}'},
                data: [{value: 50, name: '回帖量'}]
            }
        ]
    };
    setInterval(function () {
        option2.series[0].data[0].value = analysisTwo;
        myecharts2.setOption(option2, true);
    },1000);
    // myecharts2.showLoading();
    var names = [];
    var nums = [];
    $.ajax({
        url:'AnalysisServlet.do',
        type:'post',
        async:'true',
        success:function(data){
            analysisTwo = data.analysisTwo;
            myecharts2.hideLoading();
            myecharts2.setOption({
                xAxis:{
                    data:names
                },
                series:[{
                    name:'销量',
                    data:nums
                }]
            });
        },
        error:function(){
            myecharts2.hideLoading();
        }
    });
</script>
</body>
</html>