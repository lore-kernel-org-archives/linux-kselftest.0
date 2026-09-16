Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A54D957F
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592589; cv=none; b=QO7J0TMrHbwQ0UZIPMmAi6gvN9TJXqpw72JNjrWSCNbYWLnGgVaYyNZrYmPotbwEB+cbsK/D/kzerBTOsQHLs5HUrpHB6A2MGmzGrpK6++1p5Ij+Xb7Gd+aHz8diLUdQSbSljVHusytSCvWgfMIBeA9AY/D7IXNwXbtJcz3323c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592589; c=relaxed/simple;
	bh=t6Ey1Skts6LhNlHmrxVnF5Fj2sFH7x2b3BqTdVz2dII=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q5krSaaFvXirPcXCzH4KERXw3RKfkNNHJi2loBjYuwmPbPZbSNf+boPhS86NkUFMdaFPQ14lCvyN9YIvtjEiaPZW+nQb4K7OSuBuE0Ev2gIkmRqLDmowInz+MJkmXoUlLp42W71jbeSH9CzhdQusKVG0gT12pqQjuUtUVUJVUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmhXPK2+; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmhXPK2+"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so95859a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592573; x=1790197373; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0PiPkE53/kByahLJHuGHd4DXMGbPCcWOf05KFD1zLw=;
        b=WmhXPK2+YfmrBfZDX1bHDCsWxW/ON5iq+qY75gxkJIUWuV1g7Tap/+bJJMQec/cDCa
         wXZ/McLcYp/n3vlNjKf8iIYggO6sj5ypGzUONZL3EE/hcj9TyIYX94Na3AUkIOK+7KY/
         CjBKs5ipq7/i38aQct2wESba9bR0wfSeNZCJCkT5JqKcPB4nDA3lkrMtBoHIvtHiwlXJ
         10xH0SO+fxgod70K4VjbstOd2PFsDDWvX2BxiESLlOcrLzgrpgQzlLQciel4ZepqPBRJ
         zCsxxrymL4yLkrGP/9LYZIbxvXHM/e8LzlTtZL/5X3ZOZKMuAeE86Mwt1EVtV5nPm3AQ
         GSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592573; x=1790197373;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0PiPkE53/kByahLJHuGHd4DXMGbPCcWOf05KFD1zLw=;
        b=Bdd6q7HbWcFjPqRRK9Z4mH76aJepHohuW2RPAlx8pApUS8NfpF9p6fqGhiHFaiG2Fs
         yqVpCN35gKhP3Qw8acfp6vsl/QYIFuODbxwyXdzH5MmukLSPSGe3AeuXyKLbYhsjdxOH
         S/CVml+zkvSJKx7X4WlJd283dBsoUP1qhjd5blHZEyB7b3cjwXWoIhhYS7zjBvbUB7Hf
         oc+0qyVtlABcg8yVzsYKE0OKkT9f+fFAtqxNEx0trk7Tgi/XZHyhh6yI2ZMMzAubt1/R
         QVMmnXOKI3N3tHh2de4Jo2i1WWrVA1q9F8KJcb5+47i84uRg80/enarw67EN+AtZPnI8
         tw4w==
X-Forwarded-Encrypted: i=1; AKwUvByrFjGghEqcBC1conxSSRcQgHQNJVAChLt3YXjNTJot17WVc50Reijjgegu0cYtjJIA0D6f9KdPAsa8rP3k6CU=@vger.kernel.org
X-Gm-Message-State: AFuF++ngi+YcsM3um4IwzAxolFEYcxkdzRArgFVk8vo+B74IWJ4aXCWi
	4S/rvA4Y6GsYeDBjmtrrnWgW3RcbVDQsL/eEz9/QLPsTwSlEG+yJDc/G
X-Gm-Gg: AYBFou0699u0E5BA5XiE6ID8VXlPS/ml1oJDi+wwM8WReB1+FmiPDNTnCKF2cDzGr+2
	ceIn7v76C375BQmC5jA3UsZRU1iuip9MpN/RLlD6zeRhcHiYortgQAkrXv/puJwjYwiZiodlcXo
	e1ZnSO9rZWypsp7A4NsxXgYfkhuU7eL2mPEoXUdDCpNbLESleGLX+TCnHqVLuazMDQ4LlO86WfZ
	sja7i1ZI4U7/Ux0dBnw/udguxRUzDniVDqEvwru5pDJpA70XpMTbnIRHVS31pB2FcihqjXb9I/5
	jyMqs2xEW9BraQ9Ah7Q4WWq7wMdvGIjDQHTyaCQnhqo/v359yf3TvhLyTAhiYbajrWI6tcBTk/r
	OM1KQ49ZZ2v4hzgoWrgXYINtC7Vei+7GgjN2KvqQvahuXvBwjZp880JsQ7VKfxvyhdtd43QI9UP
	un8dSORuDy0CfCRDrE8cC7vaOcm8EQ459bnL3pd80NDgb1HEM68N3CYioMV4t9kLHe4yh86KuQk
	FOxtuE6xgEDw/7lNJmHIGTsbucCk9x3s5MmPyMoIAxJCtyjoKl/qaiXbxG27JTIJVzhePob6l20
	AKFGcDO3mZaT+YcChFJPIReIBj3pHdJIRNUPqKYp8H5zFgErO4ib3SxK
X-Received: by 2002:a17:90b:4c88:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39e1e56637bmr8836686a91.25.1789592573141;
        Wed, 16 Sep 2026 14:02:53 -0700 (PDT)
Received: from localhost (ec2-35-83-186-167.us-west-2.compute.amazonaws.com. [35.83.186.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e732d6sm1163831a91.11.2026.09.16.14.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 21:02:52 +0000
Message-Id: <DLH1MDZPU5G0.228555JR34D3N@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 01/13] bpf: move linked-scalar flags out of
 bpf_reg_state->id [NFC]
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-2-vineet.gupta@linux.dev>
 <DLDKB6BTHVXE.PFK87O3QY1J5@gmail.com>
 <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev>
In-Reply-To: <f575fe19-a5a0-4f43-b1bd-cdec2c6e9830@linux.dev>

On Tue Sep 15, 2026 at 1:17 AM UTC, Vineet Gupta wrote:
> Back when I started, keeping it NFC made more sense. But with all the=20
> nuances discovered in the process, I'm inclined to drop the NFC stance=20

What is NFC ?

> and make functional changes - there's at least one which is the=20
> following accepted pre-series and now rejected.
>
>  =C2=A0 =C2=A0 =C2=A0 old {r2.id=3DA+delta32}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0vs cur {r2.id=3DB+delta64}

that's a red flag, no? The refactoring patch shouldn't have
any changes to selftest and veristat numbers?
Unless I'm missing it again.
