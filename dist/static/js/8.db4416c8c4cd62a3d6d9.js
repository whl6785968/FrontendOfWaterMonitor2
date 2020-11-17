webpackJsonp([8],{oC0s:function(t,e){},otcZ:function(t,e,l){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a={methods:{initData:function(){var t=this,e={page:this.currentPage,pageSize:this.defalut_pageSize};this.$store.dispatch("sysd/getAllStation",e).then(function(e){for(var l=[],a=e.obj.list,i=0;i<a.length;i++)l.push({stationId:a[i].id,stationName:a[i].name});t.tableData=e.obj.list,t.totalPage=e.obj.total,t.stations=l})},handleSizeChange:function(t){var e=this;console.log("每页 "+t+" 条"),this.defalut_pageSize=t;var l={page:this.currentPage,pageSize:this.defalut_pageSize};this.$store.dispatch("sysd/getAllStation",l).then(function(t){e.tableData=t.obj.list,e.totalPage=t.obj.total})},handleCurrentChange:function(t){var e=this;console.log("当前页: "+t),this.currentPage=t;var l={page:this.currentPage,pageSize:this.defalut_pageSize};this.$store.dispatch("sysd/getAllStation",l).then(function(t){e.tableData=t.obj.list,e.totalPage=t.obj.total})},open:function(){var t=this;this.$store.dispatch("sysd/getAllUser").then(function(e){t.users=e.obj;t.$store.dispatch("sysd/getAllDistrict",{page:1,pageSize:1e4}).then(function(e){t.districts=e.obj.list})})},add:function(){var t=this;this.$store.dispatch("sysd/addStation",this.form).then(function(e){200==e.status&&(t.$message({message:e.msg,type:"success"}),t.reload())})},showModifyWindow:function(t){this.dialogFormVisible2=!0,this.form1.id=t.id,this.form1.name=t.name,this.form1.longtitude=t.longtitude,this.form1.latitude=t.latitude,this.form1.currLevel=t.currlevel,this.form1.preLevel=t.prelevel,this.form1.user=t.userinfo.uid,this.form1.district=t.district.id,this.form1.upstreamId=t.upstreamId,this.form1.downstreamId=t.downstreamId,this.form1.isAlert=t.isAlert},modify:function(){var t=this;this.$store.dispatch("sysd/modifyStation",this.form1).then(function(e){200==e.status&&(t.$message({message:e.msg,type:"success"}),t.reload())})},showDeleteWindow:function(t){this.stationId=t.id,this.centerDialogVisible=!0},deleteStation:function(){var t=this;this.$store.dispatch("sysd/deleteStation",this.stationId).then(function(e){t.$message.success(e.msg),t.reload()})}},inject:["reload"],mounted:function(){this.initData()},data:function(){return{tableData:[],currentPage:1,defalut_pageSize:10,dialogFormVisible:!1,dialogFormVisible2:!1,districts:"",users:"",totalPage:0,stations:[],centerDialogVisible:!1,stationId:"",form:{id:"",name:"",longtitude:"",latitude:"",currLevel:"",preLevel:"",user:"",district:"",upstreamId:"",downstreamId:""},form1:{id:"",name:"",longtitude:"",latitude:"",currLevel:"",preLevel:"",user:"",district:"",upstreamId:"",downstreamId:"",isAlert:""}}}},i={render:function(){var t=this,e=t.$createElement,l=t._self._c||e;return l("div",{staticClass:"stationManager"},[l("div",{staticStyle:{"margin-bottom":"20px",float:"left"}},[l("el-button",{attrs:{type:"success"},on:{click:function(e){t.dialogFormVisible=!0}}},[t._v("添加")])],1),t._v(" "),l("div",{staticClass:"block",staticStyle:{float:"right"}},[l("el-pagination",{attrs:{"current-page":t.currentPage,"page-sizes":[5,10,15,20],"page-size":t.defalut_pageSize,layout:"total, sizes, prev, pager, next, jumper",total:t.totalPage},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}})],1),t._v(" "),l("el-table",{staticStyle:{width:"100%"},attrs:{data:t.tableData,border:""}},[l("el-table-column",{attrs:{fixed:"",prop:"id",label:"站点编号",width:"100",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"name",label:"站点名称",width:"120",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"longtitude",label:"经度",width:"120",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"latitude",label:"纬度",width:"120",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"currlevel",label:"当前水质等级",width:"100",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"prelevel",label:"上周水质等级",width:"100",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"upstreamId",label:"上游站点",width:"100",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"downstreamId",label:"下游站点",width:"100",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"responsible",label:"负责人ID",width:"120",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"userinfo.name",label:"负责人名称",width:"120",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{prop:"district.name",label:"所属片区",width:"200",align:"center"}}),t._v(" "),l("el-table-column",{attrs:{fixed:"right",label:"操作",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[l("el-button",{attrs:{type:"text",size:"small"},on:{click:function(l){return t.showModifyWindow(e.row)}}},[t._v("修改")]),t._v(" "),l("el-button",{attrs:{type:"text",size:"small"},on:{click:function(l){return t.showDeleteWindow(e.row)}}},[t._v("删除")])]}}])})],1),t._v(" "),l("el-dialog",{staticStyle:{"margin-left":"200px","margin-top":"-100px"},attrs:{title:"添加",visible:t.dialogFormVisible,modal:!0,"modal-append-to-body":!1,width:"600px"},on:{"update:visible":function(e){t.dialogFormVisible=e},open:t.open}},[l("div",{staticClass:"add_form",staticStyle:{"padding-left":"100px"}},[l("el-form",{ref:"form",staticStyle:{width:"500px"},attrs:{model:t.form,"label-width":"120px","label-position":"left",size:"small"}},[l("el-form-item",{attrs:{label:"站点编号"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.id,callback:function(e){t.$set(t.form,"id",e)},expression:"form.id"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点名称"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.name,callback:function(e){t.$set(t.form,"name",e)},expression:"form.name"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点经度"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.longtitude,callback:function(e){t.$set(t.form,"longtitude",e)},expression:"form.longtitude"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点纬度"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.latitude,callback:function(e){t.$set(t.form,"latitude",e)},expression:"form.latitude"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"当前水质等级"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.currLevel,callback:function(e){t.$set(t.form,"currLevel",e)},expression:"form.currLevel"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"上周水质等级"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form.preLevel,callback:function(e){t.$set(t.form,"preLevel",e)},expression:"form.preLevel"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"上游站点"}},[l("el-select",{attrs:{placeholder:"请选择上游站点"},model:{value:t.form.upstreamId,callback:function(e){t.$set(t.form,"upstreamId",e)},expression:"form.upstreamId"}},[l("el-option",{attrs:{label:"无",value:"null"}}),t._v(" "),t._l(t.stations,function(t,e){return l("el-option",{key:e,attrs:{label:t.stationName,value:t.stationId}})})],2)],1),t._v(" "),l("el-form-item",{attrs:{label:"上游站点"}},[l("el-select",{attrs:{placeholder:"请选择下游站点"},model:{value:t.form.downstreamId,callback:function(e){t.$set(t.form,"downstreamId",e)},expression:"form.downstreamId"}},[l("el-option",{attrs:{label:"无",value:"null"}}),t._v(" "),t._l(t.stations,function(t,e){return l("el-option",{key:e,attrs:{label:t.stationName,value:t.stationId}})})],2)],1),t._v(" "),l("el-form-item",{attrs:{label:"负责人"}},[l("el-select",{attrs:{placeholder:"请选择活动区域"},model:{value:t.form.user,callback:function(e){t.$set(t.form,"user",e)},expression:"form.user"}},t._l(t.users,function(t,e){return l("el-option",{key:e,attrs:{label:t.name,value:t.uid}})}),1)],1),t._v(" "),l("el-form-item",{attrs:{label:"所属区域 "}},[l("el-select",{attrs:{placeholder:"请选择活动区域"},model:{value:t.form.district,callback:function(e){t.$set(t.form,"district",e)},expression:"form.district"}},t._l(t.districts,function(t,e){return l("el-option",{key:e,attrs:{label:t.name,value:t.id}})}),1)],1)],1)],1),t._v(" "),l("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[l("el-button",{on:{click:function(e){t.dialogFormVisible=!1}}},[t._v("取 消")]),t._v(" "),l("el-button",{attrs:{type:"primary"},on:{click:t.add}},[t._v("确 定")])],1)]),t._v(" "),l("el-dialog",{staticStyle:{"margin-left":"200px","margin-top":"-100px"},attrs:{title:"修改",visible:t.dialogFormVisible2,modal:!0,"modal-append-to-body":!1,width:"600px"},on:{"update:visible":function(e){t.dialogFormVisible2=e},open:t.open}},[l("div",{staticClass:"modify_form",staticStyle:{"padding-left":"100px"}},[l("el-form",{ref:"form1",staticStyle:{width:"350px"},attrs:{model:t.form1,"label-width":"120px","label-position":"left",size:"small"}},[l("el-form-item",{attrs:{label:"站点编号"}},[l("el-input",{staticStyle:{width:"200px"},attrs:{disabled:""},model:{value:t.form1.id,callback:function(e){t.$set(t.form1,"id",e)},expression:"form1.id"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点名称"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form1.name,callback:function(e){t.$set(t.form1,"name",e)},expression:"form1.name"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点经度"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form1.longtitude,callback:function(e){t.$set(t.form1,"longtitude",e)},expression:"form1.longtitude"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"站点纬度"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form1.latitude,callback:function(e){t.$set(t.form1,"latitude",e)},expression:"form1.latitude"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"当前水质等级"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form1.currLevel,callback:function(e){t.$set(t.form1,"currLevel",e)},expression:"form1.currLevel"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"上周水质等级"}},[l("el-input",{staticStyle:{width:"200px"},model:{value:t.form1.preLevel,callback:function(e){t.$set(t.form1,"preLevel",e)},expression:"form1.preLevel"}})],1),t._v(" "),l("el-form-item",{attrs:{label:"上游站点"}},[l("el-select",{attrs:{placeholder:"请选择上游站点"},model:{value:t.form1.upstreamId,callback:function(e){t.$set(t.form1,"upstreamId",e)},expression:"form1.upstreamId"}},[l("el-option",{attrs:{label:"无",value:null}}),t._v(" "),t._l(t.stations,function(t,e){return l("el-option",{key:e,attrs:{label:t.stationName,value:t.stationId}})})],2)],1),t._v(" "),l("el-form-item",{attrs:{label:"下游站点"}},[l("el-select",{attrs:{placeholder:"请选择下游站点"},model:{value:t.form1.downstreamId,callback:function(e){t.$set(t.form1,"downstreamId",e)},expression:"form1.downstreamId"}},[l("el-option",{attrs:{label:"无",value:null}}),t._v(" "),t._l(t.stations,function(t,e){return l("el-option",{key:e,attrs:{label:t.stationName,value:t.stationId}})})],2)],1),t._v(" "),l("el-form-item",{attrs:{label:"负责人"}},[l("el-select",{attrs:{placeholder:"请选择活动区域"},model:{value:t.form1.user,callback:function(e){t.$set(t.form1,"user",e)},expression:"form1.user"}},t._l(t.users,function(t,e){return l("el-option",{key:e,attrs:{label:t.name,value:t.uid}})}),1)],1),t._v(" "),l("el-form-item",{attrs:{label:"所属区域 "}},[l("el-select",{attrs:{placeholder:"请选择活动区域"},model:{value:t.form1.district,callback:function(e){t.$set(t.form1,"district",e)},expression:"form1.district"}},t._l(t.districts,function(t,e){return l("el-option",{key:e,attrs:{label:t.name,value:t.id}})}),1)],1)],1)],1),t._v(" "),l("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[l("el-button",{on:{click:function(e){t.dialogFormVisible=!1}}},[t._v("取 消")]),t._v(" "),l("el-button",{attrs:{type:"primary"},on:{click:t.modify}},[t._v("确 定")])],1)]),t._v(" "),l("el-dialog",{staticStyle:{"margin-top":"20px"},attrs:{title:"提示",visible:t.centerDialogVisible,width:"30%",center:"","modal-append-to-body":!1},on:{"update:visible":function(e){t.centerDialogVisible=e}}},[l("span",[t._v("该操作会删除位于该站点的设备信息和此设备具有的数据，确定删除吗？")]),t._v(" "),l("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[l("el-button",{on:{click:function(e){t.centerDialogVisible=!1}}},[t._v("取 消")]),t._v(" "),l("el-button",{attrs:{type:"primary"},on:{click:t.deleteStation}},[t._v("确 定")])],1)])],1)},staticRenderFns:[]};var o=l("VU/8")(a,i,!1,function(t){l("oC0s")},null,null);e.default=o.exports}});
//# sourceMappingURL=8.db4416c8c4cd62a3d6d9.js.map