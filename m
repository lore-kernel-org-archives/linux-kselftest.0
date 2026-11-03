Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724702;
	b=vnSLo6ysl+jFRuUuFL45kZxI5Cvjc2veHSmlAxfDrhCeP1rclOgX4S101Ay2OcqJR0Zm
	 MoWMxce6IE/Z/YMNI8LYNGWRVIvevWPR9lO9SI3ZghSEyEIy2X7+s1rcWrtAc8S3jA3Al
	 z8b0Uhv4F9nbyxtokq7GRue6ceQt7xB0EdPINjWrQA2LkljoKE1aAjNFWUFDYj5inrgWh
	 LtGkZLeVvzcVHI0/+oXtqDc8XPzeK1/oO5uzdu8DbCMlwoKeRRLY3t3v7B0f0EeEqnoX0
	 8t7HbipEmq5eqIeLlESDhI7EDPK8wrvi2iTvEhZ5c9TZRjzgHs8y+FFcCehVc72NMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
	b=ThyJARHiLVB5zJiCpD2hFS6+6J9qOX2D06lJ0tKqIMPGJnYaoa9eOk5KyrTGWEohrbA0
	 KAdbYPaGGCkDc9kXwfCMDE5n1j3GQI22jCMTvqUqgkSapTsTczHDKzxWUCDamBiD2MJiA
	 ZIEFsCS7TORU5DkZbCNuFx0pc3iPjIVtY+kBiMinXb+jFvsgJC1xRYfGGjwLa1kXHEOqx
	 Zmde0oct2OnN3/gK8XePgtovkSRziKkIwZlOmZs5elRxOjJckgqLFvNo/0KtLpHPBp1KO
	 hVa2QbKEdW6F8Un31Moo3kuV9LaRuhbp/QxK6yJk5YwdU7oZG+hyCFLfRIUArdJHmkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTIFtqdT;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFE606A33C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 16:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAFE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTIFtqdT
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2940231b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724701; x=1794329501; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
        b=eTIFtqdTdXpA/AfqqKkL10HIQZLcduWeqawGhkY8XSlpOW7wAg7SwK7IyckCmAeC8z
         QZEJnVKKbFm1lme2SYMMxv1HNP1Njw8KJE3QtzbovqqCyntSjZr0OxFCZk8earTy7ZeP
         s5VZOXYH++PjPF1kTEA3lESRC8qsEpTcVQUri9WLAkuFv2cuZix2S1MDadbIk2gWxXcO
         a1CWIRWP4N0snge7OVszIUi9zzUBbb6XW85sc28z+DIK0qUMW3AE1Bt1XJHJEohjeBO9
         ub6LOMq+gg31oFsCGTjAhEdvsMpjkdKA0Yw0Eq/2gp4qZRvsM2ML5GSPlkglQB80sBeL
         ogXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724701; x=1794329501;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
        b=vIZ259AbOsjrlnfwlwy2C+VkGVub6fyRXbVco53O+Uh3D/tDE2hpo6bQkmfLlVqyp2
         mtRk01Cg+QHl1LyyhC4jMwaBWJzBxZsUqgzRvq0+O6REX2JT8Uk4m2iglbaTM+DuYjPe
         8vJ0kGjrc8A11VH+InH3pW3TYZOooVyRHXh0x6Pa0RWvNDINyAybG8M5yceTEAfop7g3
         6/sTBIvHLnH6hvM/u+BsAzCzq5p96XCkZRxyRqbaQf/9jQJ/Oe8wGoFHQpLEra9Q06i9
         HPfId0lGO4G4kSkJAUvKMqb/+Buq93uEf4TkoFvHX//J8ISIcjRDT5xZbzjaTSlcaz7J
         NNWg==
X-Forwarded-Encrypted: i=1; AKwUvByqZNfByq+uEfKIp2XktGpp4Pca5DT8QUQ3nb/aSqZbAHPB36xtrcDHZUxcW9KXGDTVsXhFUMJuR4j1VBVx9xM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LXmbdZ/hqGi79lwvQpr2YOj2dPYuftKOSRzajzNIQgQ8S9hfv
	l0WRkTBXKKHBfRWyHrDBo6gx0eXIFhHdSKok3K62EYs/JTQWNPNk9Hti
X-Gm-Gg: AYBFou03aDoxd5Jz5f9KiccdiNz9sZ+9UZa/RE/NDv0oFZtNitXnu6G2ZmE1ttARndO
	/d9lfVoIFyRRzBVGSP4+FilJ0ZQAJzeIeEQIdfdTewxmPikD41vEHymIovCV4AuSu+QygvVGTtH
	ZenRnfIJ0xBRBqLVbh6Ky1E1predMYPfiz+j6J5zo2JfRsSqXK7SU4Kq+BYGSBqNLCu/PVUjemk
	D7qbWQhSS53+Nh9nL5tQK+cIs2GaFi+OlJBj7fvPudXzR5ghPdz6OayaOaGDwynIlolNc9CrPFj
	S6uX5YvJcWyyagK64NDhedOdd1yNeuYBqal+uwuEFc0xrPizUj41dvIDRLd1mKRtqjDxb8ZSOOJ
	8yl7IRXMp+rBBcJ2LFLC+PEnBVg0KKacyP6lcuAdtT1PCFzbOVkJE4+uBh+oKnpCYtZ3jVd1weI
	WI1Qny6zvGBNeX+Xl89kFso0Xr7xstRWEF0hTpVNHv7n1cFOXBjQULEOMUeLf7CnYayCDDfYUUk
	dUAYk8+gLKzGEb/3jewqYdpv0Zg8GYvW5iEmZUvaFV5ywyk7VtoS7bAhAqfDvhqpEYc252AQMU1
	kvPWIMjUm6xai78sbRPmiuUULtR6gIIVxSG1bIbeRz+6UNLMlE15U0eMBdeSWiznpQkBc5fijeR
	1LVvOJuKWvuC2lDnc3ejnEnxmvhF0zdShzw==
X-Received: by 2002:a05:6a00:3a12:b0:8a0:2cfd:87cb with SMTP id d2e1a72fcca58-8a9bf90ab27mr11070101b3a.43.1793724700510;
        Tue, 03 Nov 2026 08:51:40 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fccffsm3794904b3a.7.2026.11.03.08.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:51:40 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 16:51:39 +0000
Message-Id: <DMLQC758A2C3.175VOTFQ2Z8HD@gmail.com>
Cc: <cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <daniel@iogearbox.net>,
 <linux-kselftest@vger.kernel.org>, <cuitao@kylinos.cn>,
 <ameryhung@gmail.com>
Subject: Re: [RFC PATCH v12 1/4] blk-iocost: add BPF struct_ops cost model
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tao Cui" <cui.tao@linux.dev>, <tj@kernel.org>, <josef@toxicopanda.com>,
 <axboe@kernel.dk>
In-Reply-To: <20261103132613.1952975-2-cui.tao@linux.dev>
References: <20261103132613.1952975-1-cui.tao@linux.dev> <20261103132613.1952975-2-cui.tao@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 05:26 AM Tao Cui <cui.tao@linux.dev> wrote:
> @@ -3223,7 +3306,6 @@ static u64 ioc_weight_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
>  	return 0;
>  }
>
> -
>  static int ioc_weight_show(struct seq_file *sf, void *v)

Unrelated change. Tejun pointed at this hunk in v11.

Overall makes sense to me:
Acked-by: Alexei Starovoitov <ast@kernel.org>
