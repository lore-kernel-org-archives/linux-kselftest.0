Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029974;
	b=yFeeLjVKjWpkj418WfhGs3sMq/FmANFn0zBO98NhEmfMU4HXz8S2K8GdlwE+zNzteQqo
	 pSOteWpbf3Biz9eXvTqb1pvxkA2z1B+q6EqEhJnj9WIkRWMIy8M8k21HQcfGuB9o/lndd
	 961fSmZbnqJUvHG2BbCKmmQxSsAQvv3u64pCFUiP15/cE5/4Z50fIH3vTumvM0dEtEppe
	 f7Ny2mIgiwa52RmbbW2aUkJEukMYZCY1bUWct4gZmA3xWYBT6hWl4xaGfwVHylldm5phe
	 lS0Uqgx6M0A1tHHI7xeh5py6JstsdWrSYNm+wHKuZxWHKIvfD2KcEa/nkXISIKoFOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
	b=4RNukLrMG6u9wdeKvKx1kgpp+cv8g0dOFrdfTijVgQPA4eQ6y49MYY4Iu8S5zA7S4MUX
	 dEoxMbhon1MMMJPkamSlOAoVPR51LMq4DTIVK/ADSxhS4t/dW434X/vcFhXR4wQO9iPHN
	 n9FTc7D8PihzywowgYsLm96gP0GzmNZ83AClSc6rCbW2WkoWLUM7YNjPpafm9KhMynE41
	 HPdXe5H0lVOlzJ7/2uPPvfDdcttJdXjenPxfWY6QXSBNSmlpSzFlNoh5WAH/FqNlFXr46
	 B2xUY9Vrm77cIrbJT65t5nD1nXHf7VF/ZAfG71WKlwJD6RBhLCywWU6xQBoxZfe6VpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC6606A32D
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 05:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso623949a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 21:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794029974; x=1794634774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=qYxxEQoAgeRTjMwaQDC2fAV485jTtyVXXUh6AN8P3ryYgsUwS7AzrM/L9YOTmUktBL
         GrmxIh+aph7bmf1AxySbrEQwF1kVvNaiFABat9MAI0HWL4TvDQAeVqzgzJuqtoEuw6eQ
         lXAm0ibaN7snVWedEdSBLO15ROieRTahbPsvyOWVseeXVlO35wemXKH3VSUJhQ0Lx4V7
         yrTBrej7U/w/9xOobPcuIsCY53gGXyWvz1TUQHwH3AJNJsnHoe5Esl5h88vkgrjdYMVK
         1usU1L8rLYsy61hnyX/H7fDmdOaYfPzLbXxMCOOAnoSzAfkb1XYCAlLKarUsU5kGF+KS
         +3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794029974; x=1794634774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=o/fVrWqCaEVZDEyrYSyhivZrrQtO/f++NViitQ4Dl5Gcl6gc8C9Xve8mjCBlHoi6bJ
         uYDI8i8Z5csVOjDbSMVhl+//JQOe1CiUGlDu9i7+d1/1zhoyiCyHS4Hc+Va7qFtDf56F
         ZVI/6dMp+7HC8nF9BL7N5UYJv4jiGm5W8ORY5mKlbYRebxy5Qo6Ki/nt6GS6+e9vxkPG
         Ec+rtmNsRPkIAahF0vOCFCU3NWEL9XYy8WnYKDmvCSG934UvrQ+/9GnmnRyX+KPaphMM
         7VSSgUJ5sjO9wC2i40m5J3n2qasbVvZMoLPX1vvQO4cKsWqDv1mnSeA3MWCnEvaJze4R
         DZbg==
X-Forwarded-Encrypted: i=1; AL+hErHd68QVZ5vlJUu387+HekW3GXCinPN3iM0DFCDoVpt4m9FTMmMbdq8Q0GkLUg7fPLOdboDFN7nE0BYG5iILpUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sgwNizeGmATReOd9ca4oAZsR60NuZ4FST+qI7nzPnSJjHyUrN
	nK5aHofgqK8cpH4bmhjLwaxDMgMPQibJzD54FzQjNHzG/cBSkQbs4QCL
X-Gm-Gg: AYBFou3u504boilWHU3fvoDc8r+bh0ZObK+kg/5pfDr/g9BJLVCtK7Dq3UOJ6FFwMap
	WLnciHdEyVTfLl2ZuvxLn1ZvIariO084XmsZ4J71elcfOyf/rT3EJzDN596qxCPPwUuBSNKkhwo
	9XoSIvwituAJRHAz2xdmWfZPJrULuIjuYAVBBzyi7+tKN1g0pRXy25mqSgGGxQuPYhMf5r9kLCB
	dCWhsdmFGSpYHsx0BRqY6BuML5gMS5/r1PdTeP4fEPCNfG8Lle/r4fM1B1r6Rr3MJ3JFj8xNo5u
	VHdCMNas2FWUJZdqOF5e+ogsCIqcNfovAeimSc2bfxFTRTcRPu+XeRqyUeY1M9KcX3EOe43Jk0I
	eUPvE/ZIy/VuOiaA5ut9zkUKwLuPchzv0ASIAeLuFGk8Xin7md4OeByII7zz3vxlXnk2zaN0Ios
	hw4GK8io4dmGAiJYY7sZS2HABcz4X/vQu7JJc6dDSi7/aad48hEW0K8OgYbvdZrMzZmy152tzgP
	+BUc5LrIOuCmtf/cRtJ/y5u9BGcUuYu1hottCW9YdQ6p6RrheRmqevSebjT+aL4GMiyG5oNehTG
	NVbRazzOFNuKfijsYVguqK0372YcXzTs2mRpVE1pmaAG8+AdrfyOI4opcNpR/Bx7GcMduA==
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr4733562a91.62.1794029973785;
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm1838127a91.1.2026.11.06.21.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 02/10] trace: use the stackmap from the ftrace stack recording path
Date: Sat,  7 Nov 2026 13:38:58 +0800
Message-Id: <20261107053858.3070072-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103193421.63f4454a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-3-lipengfei28@xiaomi.com> <20261103193421.63f4454a@gandalf.local.home>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 19:34:21 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> FYI, the tracing subsystem requires starting subjects with capital letters:
> 
>   trace: Use the stackmap from the ftrace stack recording path

Will fix for all patches, and use the "tracing:" prefix that the rest of
kernel/trace uses.

> Also, did you use AI for this? Most of the comments are useless, and sound
> like they come from AI.

Yes. I used an AI assistant to help draft a substantial portion of the
code, nearly all of the comments and changelogs, and most of the test
programs. The design decisions are mine, and I checked the test results
and went through every version, but I should have trimmed the comments
myself before sending. Many of them were added in response to automated
review findings rather than to explain the code, and they stayed. I
should also have stated the AI use from the first version.

For v8 I am going through every comment in the series, removing the ones
that only restate the code or the review history, and keeping only what
the code cannot say. v8 carries Assisted-by tags, and the cover letter
says what the assistant was used for.

The rest of your comments on this patch will be in v8: a record_stackmap()
helper with a stub, the depth check before loading the map, a named enum,
the tracefs setup moved into a helper, a stub for
stackmap_mark_init_failed() so the #ifdef goes away, and the comments you
pointed out removed.

Thanks,
Pengfei Li
