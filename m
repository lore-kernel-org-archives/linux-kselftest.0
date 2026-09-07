Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4644E80DC
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788653; cv=none; b=XO8jFjCbHrACuNc733q6kt0a6eCUeYC4DMOHeCE8S//Ej6v/lpk2GkNfnive3RR1bSxbTfkui3IpNabDdghJliUBrMIYHyG4K3F2+TXzc/efaiIO6bU2F2D8hCTYnjr66ledVDP3J/e/NJWO9ZeJ47muYyT8mEsZotN2HzV3Wi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788653; c=relaxed/simple;
	bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXp7fiHUNhsWLZ7dJOSNHM3IR0m2XInU24+lbYH62EtGs1NNGNJtJ3LdsJPTYXHSINzsKbgizjnbsIoVzJ9ezPF+cXE3d5Q8QAsrhre0bUU7jjWy7OHwlxlaaWyVKhHfufnvVEI6XXyWrD7jQA1gvckWxW4iZJnjbTFx2e2uLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOZF4pNQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOZF4pNQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so3229242a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788788646; x=1789393446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=TOZF4pNQt12wS6QnSKbvulgQXIqYVaGnobubzBIHeWf/X3tkOXgSUQOlBVAj571A71
         Hmo1LptUqM7eKK7oz3SE86ctlvvdPO35/HfUez02OjhUGPjAE9Xitj9iz80VlUjyn4CC
         b78lH9yJCOi3kS4WXFYKP4rdUStbUJEnN1xWoCOTRxrdRSk7sXGMeop6lDeFN27yKQhj
         gMbG8gb50Re9LzIdXU5fOfWL389Qf5W8IwxSCiNL7Ntb52EgxOTtfFNtKF4vI82xE347
         GwltUC8bCoLAYz7Y3RsWSV+xxY/26+BpixpprahVU/i02QaH3UfVR/hm5ytVVc1eHWfh
         vyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788646; x=1789393446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=rDPbZT7GLCnQKswVgYg27j7TDXUq34llijR7PYB/HSZH/27tkQs6XvWVN9ADX2fy7P
         SkZpwdRGKRw9L7vPWL845B0A4zEbK7+DkzFTYE9SpQEM4yGOKhY68qKlb1S8hfAjcezp
         vZzRLy+T1AXB3o7duV/s669ubBgjZ78TcZ8M6SquXxZD4krb7fUpw+GE2zADWdoQr7+E
         GzwvWKYQOOABLHnkBvQaa1zqeMVegqDBN4pctEmz0A1MGx2l926qOyINBxRch8jOiV4C
         yHyVvhmjv3vnPz/tnbrtfRvxMk8y8OoO6y1iWK8At5u+oWfbz2XFo3X72TXkqcmJKrhn
         dP6w==
X-Forwarded-Encrypted: i=1; AKwUvBzZN/ACUyeqxOyZDpLR0qT50PuqFdPYAz8uml9mJIeeH8FnzKZ7hePYoiXhdxEs6PYJlhJIUx2O+S8DSAJc3bA=@vger.kernel.org
X-Gm-Message-State: AFuF++msJWXExynBwl6r6LLmXgddCKb9FAOCllr9gaPLJFwC3pLDPaci
	HxWa26yuyO0D+80t/ma7buvGOKsFknvoTBcF8jAQpZotdjDrCOBwLDxSoYNANPQ=
X-Gm-Gg: AYBFou0uWt7Ku3P+FnqP4vC2oJN6zrS2rUN5bz+ylvWr+kbeAmSqL0JvQToEdk5IEKW
	78YSXub+uwma/OtZbv0yybIHwHYE2CMWbja5dc2zWvlhwOianfPkupeLNzciSJDkBaEIUHx2zOq
	Uj3BvTyvnGHlpTEFLKH3551ZJnotVYGraHDiyKOi2f7v7igNs4o+Jxjl0ZZb+Ivm6qpFkvaK2Af
	TrDBk63nmGRepib742XdmFc7H02TBcmUfOcEuYLUpB6FJyv2zG4s8ZlYFtlkTCsC+Q1WGJPbRzv
	dAdbioCyrEqAS4blyHIR7q3F3oGQKgns68751zhmhXVymux+e3Pdmrzhj3K32UqBcpuKpovx8AS
	W/P7Nbfc8BGzcqFU7asm3ELnU4WwHdqDWkVp+zRRPXG4PEMFpxhKb/ktBQmxWdqSPt7Lp03ycfx
	IusuA2Mt3PMJMx3L3iPX1QqeBASqcIQ1Ft59b3r8oUmOBPtrVPuPMWpeB7N5RzNgvU30m1Wczy6
	kgL8cS6cxIsWLRo
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr33965509a91.9.1788788645675;
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm20717513a91.13.2026.09.07.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf v3 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 22:43:55 +0900
Message-ID: <20260907134356.616964-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CI reported CONFLICT on this series. It applies cleanly as posted: git am
of the list copy onto bpf/master, which is the base-commit above, and
onto bpf-next/master both succeed.
