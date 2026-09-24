Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9BD3EFFD1
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277599; cv=none; b=daPDVHAu94wqimorQpDs3a+oW8hGoygbb8Yi20mde33Spdu8JVWFYd0LWN6mtQ0TW6aMe9IsFhskXNDXuCCa/WB2CKPERoI6o9SyE/DabtbJSY2wsKjH+EbLmEm26XAHrcuDbSghFB+OgCB1SiHlBC1m0/iMy9EOnHymC2HAQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277599; c=relaxed/simple;
	bh=FXaVo11Gus9Sx6sFSQ364XFB72gAx1VxL2xi76KwxYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuHKRDrmXQ6t3G1sMdKp7I+Tj/dmNv0ZjXroCvDWfDwEt0MUIneYVIDJ39AGg1CpuI6BxfZGd09LuM6+Gv5SBSp4EA+7f+o9wRN8o9wQmAZclHbYHWwGHzeJsM0CkrJkfZJd9jg/f4FNNSDkSiixr8Ockr74jJJqBmIFvaoQuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5bDW8Pu; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5bDW8Pu"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so183607e87.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790277595; x=1790882395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXaVo11Gus9Sx6sFSQ364XFB72gAx1VxL2xi76KwxYw=;
        b=P5bDW8PuGU4I6matgNRQqLrpv0vhCR9zBq7Cyp1TKabu693zeHL1+wrOHwqxo5ilg6
         lDzQmWOSJ+wLh+ujC4MmqoA/DA2U+8kR1HhZk3vZD7W6ghqKCS1MDJlAmMu3ozxpsrQ7
         Q2VddRJTUirYiePyO1HkrWpsFKqapNXvQNQZ4dtXyNuXsHs5p1IvT+TKqwnmFP8RLxpl
         Ww4FFs6NNuHL0yiMsSNtPeKdeeWSaRic1EfkOVqz7ch+PznTKc1PmflERymEoCLcy7og
         hT9ZAmvSQInagUMYOZVfx2DcviPLFhDmV2tiYcS1lTw5Q+kPtao9FXrEP72BIp/0mZcQ
         Q/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277595; x=1790882395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXaVo11Gus9Sx6sFSQ364XFB72gAx1VxL2xi76KwxYw=;
        b=YgxSnw4jGrbF8l9J2HoQ8tSNJLe6D3aD/pyfEfRUGiVSD7HWAFle42CsaDIOBH2HsG
         KKIV8vT5U0njgJ8Jm6rCzl73hNLeXCWrAFmypU3XQpOUSIgvci4MOka8y85OOZcIgHyS
         r77uR2Nnk2YeYSwItIXUWrL8h5LVDdH3o6Ia+kBRCsdbwkw/4VMUN3kfLFvgZy9z4w0j
         JbMZNLTa5iiUyO7pc1YTaUXGvw5BBc6yf6g3+K0NNg7Dw9ckab7VDgs/I0kH52piVJ4H
         QMeARKGCATzNeieyQnfkJTUUR7ri6Z5zP4mfNgN/y/r1758KuEQS3n+ygvWsIEBVzLtp
         1aRw==
X-Forwarded-Encrypted: i=1; AKwUvBx6rrlbysmw5Me4zTMOIaaJHKiu9p6F3S2OPLpL5iQLxphXbx/UkwveiX5OqTbGv6qBlLlciOMQXR2YGPF1/B0=@vger.kernel.org
X-Gm-Message-State: AFuF++nxHzyi+xQVN/cjuWK3jjlkIYOkcnNWk/0a41ZBIlzXXjSYH3qf
	geBmGYJLf3G5XYjtQdrq8QL/KL16OQQHfBpELrhEQuO72UZfFiZ/lf3D
X-Gm-Gg: AYBFou26C3sULeuNKNQnIIraAmFKK5yC34uJClrRzNpHDIwaKTk2zkJC+mQT8hi1rq3
	iRXOQ5QlV+pu0hshwenTSq27AAw/U6kX4Zs7P5aei5hfKgMnhpQ3NHKIeVgPaVw6VkU/6INozsy
	L5SU4pLmNF9jeJyyyXR7LzV4Pg61iseODp9I4xa0tYf7cC/e0PTp+jhpXoobq5FBekzsnWAaf5z
	RY5wdboCA4w1+RirTWUK5L9xjeDJkfAfxcPpirYVri3GlkrJkyWl0o/+TjQs5x5EIqM7jcLzEmA
	SMz0e7rzL7OQim2+LkhS1aC+MmvC16aW05k7gBRm4ssm2VDWzFiXHiqsEezhi9jFoVYjNVlj9O2
	fOCRhSTCQu5RH93iWeWLayxpxJ6QgS4FTyvrWy4cIj4cDLQkMhxKYAdiX6Osn63eM4n+JtIbl3b
	ieJUUloo9gRlChnoAI9VKY3tsCLCrFJu2V2X/tCfz741cX/Wa6FUV3OUg41b19hu/eZplqOAb1w
	eA4nldEAA9CZH/a
X-Received: by 2002:a05:6512:613:20b0:5b8:bc5e:d116 with SMTP id 2adb3069b0e04-5b8df0b5871mr989865e87.64.1790277595016;
        Thu, 24 Sep 2026 12:19:55 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.131])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e68eec94sm13911e87.69.2026.09.24.12.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:19:54 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Check that bpftool reports a map it can't dump
Date: Thu, 24 Sep 2026 22:19:35 +0300
Message-ID: <20260924191944.548447-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <b5fb457e16a434d457a136a5d9286b1163fccaac99804e0f88a370a1a3b06805@mail.kernel.org>
References: <20260924160732.485650-1-skokovmaksimevg@gmail.com> <20260924160732.485650-3-skokovmaksimevg@gmail.com> <b5fb457e16a434d457a136a5d9286b1163fccaac99804e0f88a370a1a3b06805@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this multi-line comment follow the BPF subsystem style?

Fixed in v2: the opening /* is on its own line in both new multi-line
comments, the one in bpftool's map.c included. "can not" went away with
the reworded comment.
