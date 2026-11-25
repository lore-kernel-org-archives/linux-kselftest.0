Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612345;
	b=RU0j7ZvWSlVMEAStEnXAMmuUHbK2CysPiYOE+IgFYMLNEww8VDOiZXjtME3WRAlfv0+V
	 9M3EqTskJp2cv9CfnLyTrRNI5VcdC/OP6+96DX9+/VmnZ35Ta7raUjEAFAAw4jDq+dIDD
	 VQ8SA0HkxJrlNXQo7fYYOKC8Vho1LvJBj/D8jKkAvnW0cnSIHievJfW9OLYP5Hzp1pKFu
	 etvzQkOASd6Ds6aoeLA68Nk2BsECiqVhhTpB2JEOGTaiWdMcGLXYmHWAP8hSolBzWZbeM
	 Lq/bEKHK3K/bM3NtrlH8N1Mttfuc8EOcxjNo299NQ8HxcWoyIktwBQVLjmLcIh0GFOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
	b=Y1NxpnxlJeQCkXYxylZxVdXzM5iealL8Wo8ZM/bkFifOyCmX2+ioP/QZQLfE3G/wHtI7
	 VPGEp02TKEnRmlAd65lpZeoCGgouT8diiqEUVX2YkNqS3gNJSPNUCY5Uf099y0yUAP78i
	 Kx/DbZQnJUhH59j/yd3v1qepoSXr0B6KeSbhZHslKZsVrPbjmLaMoRPvLSWTFY9xL4gqk
	 2dU/27Z52eEFiwgtn5IrpF08RVERB8IGw0VSMYTcQRhnTpZ3y1BjWFshmD++tEpk3saI5
	 I1f1kp6wwoKFWF/ypjbyO1ht2beOumO9uEmJYdLyju+gv9353rgCsdKPHOizwGn8YuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3131606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 13:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3131606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55b8cd4e2abso60411571cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 05:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612344; x=1796217144; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=fzOaOKNR08ayDz631qIR5YM6RbDX4cXMRZT7PE5kvvn/ZKKFy8OqDo0kxL/CGZipfh
         yXsGpHHPH7x4KIMUFiT0hBdTKg/FHDQ+cFEBZ56hKsPDzqho3JjjnjCYeAOgQuhqrCCx
         Kyuv2Qgb2LwbL3/jeN6fbvh05cZA5VXL+0kBnF+1toR/jZjXSZvEN7CM5ELf3o5aREvn
         Eluy+jaX3sWqlm/AYzmzvCNEWh8yt3FwyrbW07O1L9zQIfpd2BGAQi/jkH+nk0STPApP
         ptq4+5w9OImGltbnF0OW7sw20wlbr2yCaaAbLC2GzlR8rCvoWGScBAMjYdoKnZdgnhiD
         xAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612344; x=1796217144;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=q+QoYHi8XcowXF6KAf50SR9flKWIXF5un7gHOkCHRK+oebxfYgRQWUyfUoDNThuELj
         OATz9pQ0mC0iN0jA0fR6O53p1919U3ljeaa+smEzwl1vY16L1XFo0IDJRrDc4N7UBHqU
         Qs2DSffTcfP2KvtCtTR//rson8OszIIF2VyUI1ZQcCI+++KJkwRWWtJ5L+7wFQYxoiYB
         aLRjL//AZaOEbAGYbfhoTqx69/uAhu9BDIGT1Ixpe2Nt7bv3++rTGg91RTQTVIsw/sZs
         uk+aLGyWFDg3BfDNA01MCCMSjoZXJhrZH4R0KK4TRilu2LG+Iw38sPp2Hmg+TFts0vhW
         dwlw==
X-Forwarded-Encrypted: i=1; AL+hErHiSM57dUAiqdte1WyFnvtRW1KMg8LJYF3YzfLV6JtZxO945PKaZQPJJ4pQvWOnlb3oJCYq3/8/tiMPahw0I6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z82+Q0FZckYDDrnmWEdMiTdFyLRnAh5WUDzHo0TSO/hopdk13oI
	7L3Zb/9X4o1fVzKTnY3YiV/w/9E53Mb3P2Xi6Rlkvgfk8ZeY1xWjFH8=
X-Gm-Gg: AZFdTZeZZOlxxUCpK651WXrVofnrzXb3M7zS04css85gyHui/LnOhHtSjVmKuQxpJ0W
	o+wLSMGH2J4Zn+Sv+/botGGul+E+PkCK+YESn/dmSETD5fVZNr0mGwX/fXBkqoBed0HXXVEjtli
	j4ZvtArT3yCdiWV0Cpghxq2PuIHejfkXXMW65PjMBGL/I+QxPiIHgbaElN10i70MIg+hmacW3th
	K9WPdm5rtifN2ExUwscJHjAQwY9zBIgFIbhnIZuDLynKUHkgrH2EZ+htJ5M79lMEN6ItHpJb5NY
	bMUnOYWuCpPv3YGhdAKDaWnbP68ZTQxNNK4dZZ7ffaqsApE5jkOyYsTN+PUBlu4eI3q4041SE9e
	90h357cmY0OOkv3cdHypt4qFLeYappJIqTlqt6l+OKpOgN6orSqtCZMt6ZokMd6Ydbc/gACjHqO
	R0YXe7FPyIBXVkrh0Jy+MzmB1DSzxtJetZ20Zm365gpSEwrh5EPHURMP65BnNd60YVJ81V6z97I
	lfeIjFVyQavgwjvxoL2pZlknFmF8wnLZ3BhH+DlfJyId8VCb7CJIByR4KVQjLz4jJ9WS7lS2ROt
	GMznokLZwKEVDrHE/xTUCD3fB394HBQSnjefyCx58mLLqv+xS+k8G+Fyp4hQkLe/XD+Jfy40q1k
	5M90IRZWXIxonlbkgYmg4TOn01NXhSAQPRCEGQmf7B0X1yb4pSKs1thskXhQIWloI2Q8DsQ==
X-Received: by 2002:a05:622a:410b:b0:535:157b:ea22 with SMTP id d75a77b69052e-55d76ac5e33mr308582181cf.40.1795612343642;
        Wed, 25 Nov 2026 05:12:23 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:22 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179558107134.36587.13120861622026385297@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Message-ID: <179561234149.225312.4673144866194884043@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David,

Thanks for the review, good suggestions. v3 follows with both.

Thanks,
Eugenio
