Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866555;
	b=Tvu3gzajx3PUknB2RWbR+EWgDuSYvP9Oc/4SouQlKLczmrKor9ueJ8YHRaFMWxIEvgFk
	 5TOp1xSmumy2cV8ztN//0WLzocrbnv+iByyv5r2qW95H71uEwJLnZJqOrX4cbmfV7MkX0
	 KqJFDmWz7Pcc9dwztbqUr6tzIAFC79SskFoMPne3mse6CK1eXsMgcVB1gBrTHEdmGU/hM
	 XSqCaWcgknYcSGcYRCyDbyUwzbuTF75m9gcyC0fYKbyZvmlBkkv5cQCHM6b/oo1pIU4gS
	 fDz2nV3QqKPyxdtoK1eMSRMOf3YNdk6sdYICT3bjw64kg97gIZLk7j++0mYYSrJiGpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
	b=YKzF+A/AHxYseRYOD1ixcg44rElupadE0bHk5DNj30Uw1dbbkSVL2FPjAIpeT5CMSmTF
	 1J6ZA1UOp1jznw/8U0A1aIcrSFJ9NlYgUUDx3pldGBKyg4/OCSoX97+RvQN7Z7zAXe+eh
	 hlxlvAI4bLRBKV/tzGhek/P5qE7DuUCj8bOmmp5NzVXyiCXMLg2cni72er7k5ABmfW55e
	 zuAQultzvv9xdd/O3ovimhJ4iUgNW5N3Jq9hXJ7rOrvNhYEvzIVf+EhZEsyDbY0/Vzq+f
	 iVe4+YhVZ8NkjRyHUDlc+LW3up+RpUj188C9fZhORmg+pOG1PJ+weLuSfY2Luy8ASbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFh2mwtp;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D01606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 11:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D01606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFh2mwtp
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso5908015e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866553; x=1796471353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
        b=aFh2mwtpLHrjgKdOdhYb592xOXx5WWMDM54foyMSTkNLn+Okk0D/uX2SIuHhOlIhjo
         vRqDBJwDEmPYNGU614TkVy8RCXyEqpjirmxrH6y2xvfq89U+WbiSw3Sdkg0KNiwYZtCB
         J21SVhCiodpqVxKvHtuXuxrAskcyz6ON87/IqK/C8SNFH3eFKzHWs4n53XgESRLLPxlO
         K0zRJ4d2p/qngCfifN2/5Nf4v65YnLbuB006MZH4eOB//5+MTCHwwBuhdOOZg8SMBM/j
         SEtXaIsGa8FEVKJ3v8kpQfjqYn7qxvcBs+6nIuUODqd3HQeZWAx88I9bB6ivtL31Uysd
         lqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866553; x=1796471353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sz7duWS2xaM7GzKqf18DzuNc7DZR5td8vc9u4f7nkuA=;
        b=lyy97yp/Vk/TFZSC6elAbZqaWpnWxddu0Jf4lm7dVE0ahYgryoqGnwgeKcREZtDq+1
         AQlC3XydmRbgobwkJ5Lj52DwlqpUswS66WEYdM30bwvwdSf3/juyhvoetBDtfj8Umth/
         bX9wzcgeZ50+D2mkXNHlUz4aaHhwpTzI6nfg+3YyhMDOC/LtbXnsx3lHYsWQzhFSZ8MG
         fRmyIF4+Z1n3gWgcGWTM8FMWv64XXMi7OtSvmrpIP1B72dszPMmFHVmReHnDdxtvFvNZ
         Jzca1HaXwEXrOcNhhlXw5a5/Snhis1WHStSuS/oq02FqoU0L7x9RGa/PD1NHOJq3Ihrz
         29Gw==
X-Forwarded-Encrypted: i=1; AL+hErFS4rlvppVDNQdk8ghiA0jtNWTnyfqFsRwsAjbqsnKHCXMiLy3TpbCRi2lFZxc1A26lGcVVFFot7obho54OBP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fis9bnyv4Jel3xjdPxmL6L6+shXunwiK/LbGwkRjyYQyqTkYn
	KtbjZEvzZK6HyEplPiH8UbzlTtllze6AoSXxDKb/H9QOCZt0vhzcAd4f
X-Gm-Gg: AZFdTZcP2Pw1sfqdL5fWsaPdaTJyVEooLX2wsP159JIDtD8BrnUmP8dCCqSlKLnTvr6
	fUCcqeBstRpCj4+regVYdsqWrqSAuxS9SAVkeQhw/DU34giCarDvMq/U21QqdJCiMKY5GgoSy2z
	Ul3QAX/5I5BB3NxdlX4ByPBQRcXGeOE1HaXVjArASf4185ESe3xlMwZespRQ9sRKnCoGrMTVBAX
	24Q91ORUHkugatQY9hUS0LuIBe037m1iyCFTBXWA3J84arwqMxmo0ecU8TpAK9Tw4IaVRf630lg
	TbapsAWsTGDhHfHTW4g7TIuzSiC6A45WWrkiUsFY89IFeHyviSpIgw7kuaT59IlGg2a8b0VKfHB
	H/wm4hvH1mtkobLqRPMqSMmc9/1j8sC08L6bO4Pa+97IPjD8tS8Ea4rMEaaHa0iQFFepQEhKRL2
	Gi71rIe/uT0+ikMO6nGURXW3AI+fWpGak4oyVvpytrzbocjQqzmAeSLe2C1RPbcBk6Jdyj5mE5w
	tbLAwg/AfIQHnhTUTQMHra/+yeHBhN4+0CmGi8BoaIvbOqo9qO48QQqY7L/TnMK8oUHhrnFgMGs
	Pc1t6GtlHxdN48u9eztWJ0kFl3z1wRmfK1mOhilVMHIT
X-Received: by 2002:a05:6512:12cd:b0:5c1:522e:3d44 with SMTP id 2adb3069b0e04-5c1bc7c22fbmr9479195e87.23.1795866552941;
        Sat, 28 Nov 2026 03:49:12 -0800 (PST)
Received: from thinkpad ([92.36.65.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050ff30sm67319321fa.18.2026.11.28.03.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:49:11 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: david@davidgow.net
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: Re: [PATCH] x86/e820: Add KUnit tests for table sanitizing and range update
Date: Sat, 28 Nov 2026 14:48:50 +0300
Message-ID: <20261128114850.1683690-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179576714578.1671685.15482503905360730523.b4-review@b4>
References: <179576714578.1671685.15482503905360730523.b4-review@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

Thank you for the review and for running the tests.

> I do think there'd be some benefit going forward to extending this to
> cover other parts of the e820 handling code [...]

If you have not started polishing your sketch yet, I would be happy to
try turning it into a proper follow-up patch on top of this one. I would
mention you with a Suggested-by tag, or however you prefer, since the
idea and the stub approach are yours. Would that be OK with you?

Thanks again,
Andrey
