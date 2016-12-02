//
//  HeaderUrl.h
//  TMX3DPrinter
//
//  Created by kobe on 16/8/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#ifndef HeaderUrl_h
#define HeaderUrl_h

//#define Release
#ifdef  Release
#define URL_Header  @"http://app.yeehaw3d.com/"
#else
#define URL_Header  @"http://120.24.226.237/"
#endif

#define TMX_AppPublickey       @"v1/api/getPublicKey"                       ///<获取公钥

#define TMX_BindPrinter        @"v1/api/printer/bindPrinter"                ///<绑定打印机
#define TMX_PrinterStatus      @"v1/api/printer/printerStatus"              ///<查看打印机是否在线
#define TMX_PrinterList        @"v1/api/printer/printerList"                ///<我的打印机
#define TMX_ShareUserList      @"v1/api/printer/shareUsers"                 ///<打印机共享用户列表
#define TMX_RemoveShareUser    @"v1/api/printer/removeBinding"              ///<分享着解绑自己下的共享者
#define TMX_UpdatePrinterName  @"v1/api/printer/updatePrinterName"          ///<修改打印机名称
#define TMX_PrinterTaskList    @"v1/api/printer/printQueueList"             ///<打印机任务列表
#define TMX_PrinterModel       @"v1/api/printer/printModelQueue"            ///<打印模型
#define TMX_PrintModelWithFileName @"v1/api/printer/printByFileName"        ///<通过文件名打印模型
#define TMX_CancelPrinterTask  @"v1/api/printer/stopPrint"                  ///<取消打印任务（正在打印中的任务）
#define TMX_StartPrinterTask   @"v1/api/printer/beginPrint"                 ///<开始打印任务
#define TMX_StopPrinterTask    @"v1/api/printer/printQueueCancel"           ///<机主取消打印任务
#define TMX_PrintQueueArchive  @"v1/api/printer/printQueueArchive"          ///<打印任务存档
#define TMX_RestoreArchive     @"v1/api/printer/batchUpQueueStatus"         ///<存档任务批量复原
#define TMX_WaitPrinterTask    @"v1/api/printer/sharePrintQueueList"        ///<共享用户查看打印任务列表
#define TMX_UpdatePrintOrder   @"v1/api/printer/updatePrintOrder"           ///<打印任务重新排序
#define TMX_WaitCancelTask     @"v1/api/printer/sharePrintQueueCancel"      ///<共享等待打印任务取消
#define TMX_UpdateIsDefault    @"v1/api/printer/updateIsDefault"            ///<设置默认打印机
#define TMX_UnbindPrinterInfo  @"v1/api/printer/productDetail"              ///<解除打印机页面信息
#define TMX_UnbindPrinter      @"v1/api/printer/unwrapPrinter"              ///<绑定打印机解绑
#define TMX_UnbindPrinterShare @"v1/api/printer/unBindPrinterShare"         ///<共享打印机解绑
#define TMX_QRCode             @"v1/api/printer/queryQRCode"                ///<二维码信息
#define TMX_CreateQRCode       @"v1/api/printer/createQrCode"               ///<生成二维码
#define TMX_HighterSet         @"v1/api/printer/printInformation"           ///<打印机信息
#define TMX_GetSetState        @"v1/api/printer/getPrinterState"            ///<获取情感灯光节能，安全门自动感应状态
#define TMX_GetEnergyState     @"v1/api/printer/upEnergySavingState"        ///<获取情感灯光节能状态
#define TMX_GetDoorState       @"v1/api/printer/upInductionDoorState"       ///<获取安全门自动感应状态
#define TMX_PrinterTask        @"v1/api/printer/printingTask"               ///<打印机任务
#define TMX_PrinterProgress    @"v1/api/printer/printerProgress"            ///<打印机进度
#define TMX_PrintDelectFile    @"v1/api/printer/deletePrinterFile"          ///<删除打印文件
#define TMX_PrinterCommand     @"v1/api/printer/printerCommand"             ///<打印机指令
#define TMX_UnBindPrinter      @"v1/api/printer/unBindPrinter"              ///<解除打印机绑定
#define TMX_DefaultPrinter     @"v1/api/printer/setDefaultPrinter"          ///<设置默认打印机
#define TMX_AddPrinter         @"v1/api/printer/addUserPrinterShare"        ///<共享打印机用户添加

#define TMX_AppLogin           @"v1/api/user/logon"                         ///<用户登录
#define TMX_AppLogout          @"v1/api/user/logout"                        ///<用户注销
#define TMX_ResetPassword      @"v1/api/user/resetPassword"                 ///<用户重置密码
#define TMX_AppRegister        @"v1/api/user/regist"                        ///<注册用户
#define TMX_SendSmsToken       @"v1/api/user/sendSmsToken"                  ///<发送验证码
#define TMX_AppValidateName    @"v1/api/user/check_username"                ///<检查用户名
#define TMX_AppValidatePhoneNum @"v1/api/user/check_mobile"                 ///<检查手机号
#define TMX_TalkToUs           @"v1/api/user/talkToUs"                      ///<用户信息反馈
#define TMX_UpLoadImages       @"v1/api/user/imageUpload"                   ///<用户上传图片
#define TMX_UpdateProfile      @"v1/api/user/updateProfile"                 ///<更新个人资料
#define TMX_Profile            @"v1/api/user/profile"                       ///<获取用户个人信息
#define TMX_MyCollectModel     @"v1/api/user/retrieveFavoriteModels"        ///<我的收藏模型
#define TMX_MyLikeModel        @"v1/api/user/retrieveUpvotedModels"         ///<我的喜欢模型
#define TMX_Collect            @"v1/api/user/addFavoriteModel"              ///<收藏模型
#define TMX_Like               @"v1/api/user/upvoteModel"                   ///<喜欢模型
#define TMX_CancelCollect      @"v1/api/user/cancelFavorite"                ///<取消收藏模型
#define TMX_CancelLike         @"v1/api/user/cancelUpvote"                  ///<取消喜欢模型
#define TMX_UpLoadModel        @"v1/api/user/retrieveUploadedModels"        ///<我上传的模型
#define TMX_IsOpenModel        @"v1/api/user/shareModel"                    ///<公开模型
#define TMX_DeleteModel        @"v1/api/user/deleteModel"                   ///<删除模型
#define TMX_AddReview          @"v1/api/user/addReview"                     ///<添加评论
#define TMX_CommentReply       @"v1/api/user/addModelCommentReply"          ///<模型评论回复

#define TMX_Home               @"v1/api/homepage"                           ///<首页
#define TMX_ModelDetail        @"v1/api/modelDetails"                       ///<模型详情
#define TMX_HomeClissify       @"v1/api/categoryModels"                     ///<模型分类展览
#define TMX_Search             @"v1/api/search"                             ///<模型搜索
#define TMX_CheckVersion       @"v1/api/check_version"                      ///<检测当前版本是否为最新版本
#define TMX_AllComment         @"v1/api/findCommentByModel"                 ///<查看全部评论
#define TMX_Feedback           @"v1/api/opinionByModel"                     ///<模型已经反馈列表
#define TMX_UploadByUser       @"v1/api/uploadedModelsByUser"               ///<查看用户上传的模型列表
#define TMX_ScanQRCode         @"v1/api/scanQRCode"                         ///<扫描二维码

#endif /* HeaderUrl_h */
