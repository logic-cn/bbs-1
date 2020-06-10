<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="<%=path%>/static/js/echarts.min.js"></script>
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
</head>

<body>
<div id = "main" style="height: 100%; width: 100%"></div>
<script type="text/javascript">
    var myecharts = echarts.init(document.getElementById('main'));
    var analysisOne = undefined;
    option = {
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
                data: [{value: 50, name: '浏览量'}]
            }
        ]
    };
    setInterval(function () {
        option.series[0].data[0].value = analysisOne;
        myecharts.setOption(option, true);
    },1000);
    // myecharts.showLoading();
    var names = [];
    var nums = [];
    $.ajax({
        url:'AnalysisServlet.do',
        type:'post',
        async:'true',
        success:function(data){
            analysisOne = data.analysisOne;
            myecharts.hideLoading();
            myecharts.setOption({
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
            myecharts.hideLoading();
        }
    });
</script>
</body>
</html>