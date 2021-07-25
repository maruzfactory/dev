function sendReply(e) {
  //スプレッドシートに入力された内容を取得
  const email = e.values[1] ;
  const name = e.values[2];
  const yomi = e.values[3];
  const tel = e.values[4];
  const title = e.values[5];
  const honbun = e.values[6];

  //メール送信用の変数
  const body = `
  ${honbun}
  
  ---
  氏名：${name}
  Tel：${tel}
  メールアドレス：${email}                                            
  `;
  //メール送信
  GmailApp.sendEmail(email, title, body);
}