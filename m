Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6433ACF02
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953628; cv=pass; b=Q9q3pOp/zZ/GS3j4aqyiDcSGkdxJhfduw/MxwkBYe2pDPjLVvkhcTjbfgagR25QnC5vvxU6HB/0UFsLdqrROWOnNwi4KjkHCowdL1h10uAr2tO4rhSPZWh+wZDH7brAreSAbz40l4iniGXux6U9+PFIwn9Z/RSUnsCioWW3xWtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953628; c=relaxed/simple;
	bh=Aa/68TobMq2WA7MnUgvvLadAtMm6UrCQIVjbgTR4Ayc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdqyIUQB7QyJl87npcAyNAEGpZGysZaoOESBMFJOZSvArMgc/MS/hXJojyZ7iBJDDmv7xTqiAM2PpWzmXNEc41b20F6jafumrfM5W6F+xZEEGvFptEzriRugerc+aCgxnaDyGqCsTU+loNRCsfgenFLEAK4Vg3FuFmgc/n3E3lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Stz/sQzy; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Stz/sQzy"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128ebee22caso1160048c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 13:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773953627; cv=none;
        d=google.com; s=arc-20240605;
        b=QbphP70f+ebwI73GfMPW0g1RWMPX8P+wXHimBc0iUP664DcrGNtG5nf1TifaMTkN9p
         yqRnqPk9i5ZnKp8YMoq+psiqqmwsSHZy8M4lFxQHuWA0Z7nFC4zQe8D82UBjR2NkYSOs
         1ztVqwagbKeYYExGz7oh7FcL471Gl7cY8UUnljMJiNolokwnD9hupvYuYmoj7AkRWjPI
         GEdOQpF4etvouGDaEJiI9qp3MBcsfZ8cZZmltmpyo2NNOJ32zxbZKDX3UxzfylpbFl6E
         PFcRBKlC2ZkteDplf2XQgwrT2OjA36mTAcm04QljZ2vcV2UM3JwfhRSkhbsY1F2KCwgb
         dbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aa/68TobMq2WA7MnUgvvLadAtMm6UrCQIVjbgTR4Ayc=;
        fh=lTRNJQ6lje+ib0yYorfIOVfvcMxUcHZJGor582J0f2Q=;
        b=RCNOKuYySb5zwcxaX/0ivfSD3gS5fY+ToNmZvF7VobFiHUpWoel4ytTcdq9XtviJYm
         ClRCS0XBDrIzSF7vyNwPcOiCu/sBHS3eiGxbaUip4x2TCEmCSeBtJuPyrNJyuBeLCtMf
         2W65mKUAb6UkNIP3i/5xQ7UdCYozZbMUyJlUPFO+Zd2+mIcrt1Nso6cqUc6YRQo9CmkN
         pP5QE+BTbvNuh87kAsDlcwW/HX551qI9kRPonRsVubaQ1ZoF1UC3GP3BoCeLcGwCH9zn
         S/mSEm0dmKiC8VtCXitWErjCT+usQvb9xuxs2pYErRkTO7BEBm80M/+q8NYIMBDQ3vqQ
         bFDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773953627; x=1774558427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa/68TobMq2WA7MnUgvvLadAtMm6UrCQIVjbgTR4Ayc=;
        b=Stz/sQzyMZ/kJJjTPhp3BWS0U2Ya08l5PyJBuBtdcbg9sKql3eghZTlFKSmAov5LUo
         Nd94uiNXwqPJ3Ys/ciUHsKiDxrjv3vIZacMJPSwiHoiYUYtrAvsLkpmJxUEQWJuJJZHQ
         mhTVh3Tb7hVqD77nyclc2bjnuIa6XVGzWSc6RKP+TEPFF4718llWZTvTugY0nXAbeayh
         HDOPTRYhCwW3rkVvhAWC/AX3XUPdbBfWcZW14AOv/KrZE5HNR4sH1LbNRbufL822Lqu8
         6R9E+rV1BXzo8VuM8BgD5OeUt1XXnmACAwVjBZ6aWqEWhZfy9VCh1yunBnJnCAYcJlI2
         rvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953627; x=1774558427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa/68TobMq2WA7MnUgvvLadAtMm6UrCQIVjbgTR4Ayc=;
        b=EaflG7JlThv5HCkY5WJCCS5Qgsqr7QDzfZ3SUBCWCcJ6ry6z4j3vtubDK9sq59mkA9
         twONiknKMa5+gnaqXH+Xjt6hh6cRdJ8yigfIOPBgR7RZDdVSNfRPKkdvylDQUP0+y5LY
         qOfWJ15PBW4INu/2cg/wzqEVm3KR6g5gphshr9U4rP3xjghOMgSo2XRzWV8DCU4pWAl6
         1ogOmCfjZOSWsyRow0P9WwcG1RPgQVMn0xaHmHJhKImFmFTfeZW08rWzDaH2LqxW7O44
         cwv1xcGW9y7RLY5YgLeWXhstH6Sx5ZUBdWnpbgaJcjCoyvs8l4qoKxjYKMpVUoUlTul3
         Q5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWTVllQPTlTcp0gB9/t+XLbaZaE4vPJ6P5YPJvHwOrEyYehb0+vNsjHJ8ZWo3+Z1/6AOdhH+FsSgJ860o+oFto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8x64ajgJfVBzmh97PVGQwbjJ9WDtT5oaEDlpQYdXzBxfk3Gwu
	rOLbnyQdb8OtxfJa+8xvX47eYtSrc+nzlNtGymfkIJPkAqXImqeYWY261yHDIx00GkKRJbI3gAG
	jaXnJHm9gqgMHyrBi0VnwGvGtluQUemE=
X-Gm-Gg: ATEYQzyATJcuSysU3+Z93Z6sBP5OOR/ptYAYu7MDq8x371a429zW1Hy6/gK+fDmdmAw
	ZEMqQDA2bCwHcEf9TDAHEgDJhPj+oXLiUqwjLzKhNqhv0HCSgYhjPBRk0fFHBJhEiUAide9fhB1
	c55O93UqpOKTLBSBS+HYzfOU9Y5QkiSvSofkOjvjiTYZ8BFkPRzX9cdu7BzlF3EJGU/fnHNr6NY
	ZnQ2DBukEBzFdG6vrCRX8pTx2Esz6KjNVyQq1byYWJHqiDRTRZT2pRZhcHFJIOrTsgMkIH07FbY
	KIytMVRSQgsu0d0UrLzuJhimLejW4J9CG5DVqNhJ
X-Received: by 2002:a05:7022:31a:b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-12a726cf881mr297346c88.31.1773953626588; Thu, 19 Mar 2026
 13:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317065137.1533226-1-atwellwea@gmail.com> <20260317065137.1533226-2-atwellwea@gmail.com>
 <d0ab8cc8-f734-47d4-b402-9c62ae563b4a@redhat.com> <CADVnQy=raqQ2dKwJZh2U-9=c_AEwoCS3i61oL7gUSASxBC1QVg@mail.gmail.com>
In-Reply-To: <CADVnQy=raqQ2dKwJZh2U-9=c_AEwoCS3i61oL7gUSASxBC1QVg@mail.gmail.com>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Thu, 19 Mar 2026 14:53:35 -0600
X-Gm-Features: AaiRm53MHPLs7H-KjOdESA5PQ4FyJgygf7eKubpjzFr5N2ck-0wezWHyRIsyhlo
Message-ID: <CAN=sVvycH50ZOQDb=xeW3iWG7cWO02yvd-wJ4NhbaUFHnqJ0Ag@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
To: Neal Cardwell <ncardwell@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks,

Paolo and Neal. My intent here was just to keep the test focused
on OOO SACK state and `tcpi_rcv_mss`. I appreciate the feedback.

V/R,
Wesley Atwell
