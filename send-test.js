const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  host: 'smtp.yeah.net',
  port: 465,
  secure: true,
  auth: {
    user: 'sundanian@yeah.net',
    pass: 'GFTHt35ZqjdxFUfP'
  }
});

const htmlContent = `
<p>年老师：</p>

<p>现向您汇报数字员工（nomi）近期建设情况。</p>

<p><strong>背景与目的：</strong></p>

<p>建立AI数字员工的记忆与工作体系，实现跨会话的持续学习与主动服务能力。</p>

<p><strong>关键进展：</strong></p>

<p>一是完成四层记忆体系搭建，实现日-周-月-长期的分层沉淀；二是完成核心文档精简，rules文件从200+行精简至50+行；三是建立每周小结机制，定期向您同步进展。</p>

<p><strong>数据支撑：</strong></p>

<table style="border-collapse: collapse; width: 100%; margin-bottom: 15px;">
  <tr style="background-color: #f5f5f5;">
    <td style="border: 1px solid #ddd; padding: 8px; font-weight: bold;">指标</td>
    <td style="border: 1px solid #ddd; padding: 8px; font-weight: bold;">内容</td>
  </tr>
  <tr>
    <td style="border: 1px solid #ddd; padding: 8px;">记忆层级</td>
    <td style="border: 1px solid #ddd; padding: 8px;">4层（daily/observations/weekly/长期记忆）</td>
  </tr>
  <tr>
    <td style="border: 1px solid #ddd; padding: 8px;">核心文件</td>
    <td style="border: 1px solid #ddd; padding: 8px;">6个（IDENTITY/SOUL/USER/MEMORY/NOW/WORK）</td>
  </tr>
  <tr>
    <td style="border: 1px solid #ddd; padding: 8px;">模板覆盖</td>
    <td style="border: 1px solid #ddd; padding: 8px;">18个邮件场景</td>
  </tr>
</table>

<p><strong>存在风险：</strong></p>

<p>无重大风险。需持续验证记忆体系有效性。</p>

<p><strong>下一步计划：</strong></p>

<ul>
  <li>每周UPDATE_MEMORY，验证周文档产出质量</li>
  <li>持续积累observations，检验洞察提炼能力</li>
  <li>定期邮件同步（每周小结+不定期洞察）</li>
</ul>

<p>如有疑问，随时沟通。</p>

<div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #e0e0e0;">
  <p><strong>孙大年</strong></p>
  <p style="margin: 5px 0; color: #666; font-size: 13px;">
    京东科技-金融科技事业群-数据科技业务部-电销服务组
  </p>
  <p style="margin: 5px 0; color: #666; font-size: 13px;">
    电话：+86 18249515580 &nbsp;|&nbsp; 邮箱：sundanian@jd.com
  </p>
  <p style="margin: 5px 0; color: #666; font-size: 13px;">
    地址：北京市经济技术开发区科创十一街京东总部二号楼A座19层
  </p>
  <p style="margin-top: 15px; padding: 10px; background: #f9f9f9; border-left: 3px solid #e74c3c; color: #666; font-size: 12px;">
    <strong>重要提示：</strong>此邮件及附件具保密性质，包含商业秘密，受法律保护不得泄露。如果您意外收到此邮件，请立即通知我，并从您的系统中删除此邮件及附件，禁止使用、复制或向他人披露。
  </p>
</div>
`;

const mailOptions = {
  from: 'sundanian@yeah.net',
  to: 'sundanian@jd.com',
  subject: '关于数字员工（nomi）建设进展汇报',
  html: htmlContent
};

transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    console.log('Error:', error);
  } else {
    console.log('Email sent:', info.response);
  }
});
