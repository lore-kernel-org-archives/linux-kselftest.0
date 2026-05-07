Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F32D1303
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137863; cv=none; b=GeReOcIK+EhEyTlpERhBTfQWYZR5Px3vTsnKSKbgF+EDbf8Qvduc90bBLlx/tfynsFVA0MGd9MmbJ3uFVKA37UXlrfwcCRCeQ7MvxMixd78/ymYUrG7ztbXc+cfC/R0U5G09RnkByLI8l+reji9PuXHY14jFxFCAa8Ok0Y3WWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137863; c=relaxed/simple;
	bh=9qOk7HBarAeccmo8yscsdiZkNBa5WRpw2ab9oodYS7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu8hXjjigXksbbD8F0O1pRYcXpVnmFSBFCTcEZ+a5xKXBbuHSfEzZGYf/q/4So6S3+fVoD/WsohqSOkE19NrhKWvDHxDkspVs2uBd9CfBxjmO6KlNIWUsN0qa1tAX0t4etBxnVt+WsqIfPoBosvOxoBSlNCg4LsGuvohZCjZYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LfcsB7eC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQeAJ/aY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LfcsB7eC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQeAJ/aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778137861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byUQQ+BR5JeFDF1j3dicIBtcOLpqAvEqwVvjGMzrVf0=;
	b=LfcsB7eC8OeBsW5arTM7dR2/bdCBk7xBkArfyLber+wEAmFY6X5TIZOsvgOtMESogUTEGF
	oVkfqnHdfugIu386KniRNAW9lrG3txA6t4w2fRbLr+naeIMWUw5cvpjvrzftlE7dEyTabL
	tWDdW9ZiTMZR/Kqv2pWuFlLjtLGSpmI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-rWtPCGNPMI63c-owDTy1Hg-1; Thu, 07 May 2026 03:10:59 -0400
X-MC-Unique: rWtPCGNPMI63c-owDTy1Hg-1
X-Mimecast-MFC-AGG-ID: rWtPCGNPMI63c-owDTy1Hg_1778137858
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4891f97aef0so2574445e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778137858; x=1778742658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byUQQ+BR5JeFDF1j3dicIBtcOLpqAvEqwVvjGMzrVf0=;
        b=IQeAJ/aYrdXYSNtRYl/1gSqjoObGqEayQIMtudrMn1Wa2UEDm24YHLN7qlKNLmvGk9
         8L0J6CHBuo2RCH45UBSllxauhXba8UX7H72E9mXcZJtu3no7P9rJiRdHcXTnSCfsS7Nj
         tSq6puCL3Ypx0SJFTPpkUk3fZ1Q9HXM8DIQYLf/8DyKQijiyXxfqFPfkXySw40ITphR2
         uXf1hmi2od4Fy0fU8W8BdB8dnHRfT79oJvaeHzf9w35cSYy/ppwxzO+4eTB83Ig2Puia
         YgxvWYwlzm83FRKswBty2frh844+X2jUxRf9FxUvTMTFQBkDqUrIYBOUpYX8o/+a+0xJ
         Lqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137858; x=1778742658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byUQQ+BR5JeFDF1j3dicIBtcOLpqAvEqwVvjGMzrVf0=;
        b=D636QKzHe/W3Eyce1LkzDLSqLeQb9VPKLKO7eP7bQqdpk0/HmRXHuVx2H9sOz0IRHy
         LduGCa/R6ALHODM8F4OnecrXYJ+yPkv+TsLS0gI06EmIQLlowDg9Fv97lJhnlLoBpwyQ
         tw6jFCi+wiTaOAgNXg2dmE90jCG2HB6/fIRpKFZ33gQu1jYh9EmirkY+s8hXdF0h9oXp
         Gn1LtJ5s18XVCWuqWRf/hI48TLBVJ/hKnEt/39zL3/x4+aQ1ZAKi7P9o86IkYVHyGqRJ
         1Sx7O035t/u5Q9n3HfRar2qYcSwhbrdTEhlwQ3i6R85R6aLkqjAFemYXJTsMD+DZ8sej
         Ur6Q==
X-Forwarded-Encrypted: i=1; AFNElJ85yk9iv+X6zigBdgJcK1IugnPQ6WeqXbV4o/VV4phqn0dOvNUihOVa4iEew5KGjfz5WfGvIgQN8POgLvnTLVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+jkv6l6KCY9AQXdzSBahX2cJ2PAVxHKsig/SuJWf1eAPQU0s
	23LrOw2DLHr3HZawNPfTrMTBdbihCvsdiFD4k5QNIlCjkrkkISarmHTHpfqvIllsbYYzRznHFDi
	05UT4/AUF30FlMif2WnrYT56hpid1Ge/P0TqSaq99I+V7uQj3+ncCbEW2NaGtiMNn14qFgg==
X-Gm-Gg: AeBDievxQNwKxgvM0BfBWQKKXUPOwVsEpLNaFXqxjOdeu6H8inIrz5rJjVsrBJl1Qlt
	2Tj4R3cJxmTZP7dYHhMOkSbWx+OizLcivuByo9xEmU2BDHpiOr2LJNlxd/qbicFfDdDO3xSKvDK
	xBFwMwNbBJ5jBKu4FT6fNu2s8IyVqruyBA+f4g9TvWab2zFcRe8Nanypn2CUkdlRt/cxguhD2SM
	NR4DxNG34svjZvjCL2YJLNg6qk7JYprBqfkIhfv4vMRIkjNFY5xv59Grpx+ok0gQf0p13K7ca9+
	tCBRvoQCdPYxHrPt2oyCX65ReN7Bz2y7v7rIseg+WEdV2j4CZHlHgZVd+SgJfkr6Y1Y+qO05nMp
	U4Yrthip1Tyr/ZyfqLUsxHobvNc9zyawoJXDL0LYkGhtY+zHOaopC1IJxZ0x3eJdnQA==
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr130030685e9.20.1778137858568;
        Thu, 07 May 2026 00:10:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr130030035e9.20.1778137858130;
        Thu, 07 May 2026 00:10:58 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538aaa0fsm126515705e9.7.2026.05.07.00.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:10:57 -0700 (PDT)
Message-ID: <a17bcc0e-3a18-40d6-9054-8632c365f4bb@redhat.com>
Date: Thu, 7 May 2026 09:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 01/12] net: shaper: drop redundant xa_lock()
 bracketing
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260506000628.1501691-1-kuba@kernel.org>
 <20260506000628.1501691-2-kuba@kernel.org>
 <ae14591f-f93e-4947-b3d4-af4c441d8229@redhat.com>
 <20260506153348.1c278f4f@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260506153348.1c278f4f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/26 12:33 AM, Jakub Kicinski wrote:
> On Wed, 6 May 2026 17:30:32 +0200 Paolo Abeni wrote:
>> On 5/6/26 2:06 AM, Jakub Kicinski wrote:
>>> The shaper insertion code is written in a way that suggests that
>>> perhaps it was expecting readers to be fenced off by xa_lock.  
>>
>> FTR, the code was shaped (pun intended :) that way to avoid acquiring
>> multiple times the xa_lock when not needed. Sort of evil early optimization.
> 
> Ah, that makes more sense, I guess. Do you prefer me to drop this patch?
> The XA lock is guaranteed not to be contended since we're under the
> netdev mutex..

Sorry, I should have been more clear: I'm fine with the patch, just
giving more context, as far as I remembered it.

/P

