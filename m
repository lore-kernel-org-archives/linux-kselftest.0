Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C58F4A33FB
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217459; cv=none; b=vC1ct+qzmFS1V0WYZEFRYN3YPZFpvN6q4JhQbkkz07XF0+CBzC5Be4ZqmNGmX7mVEgl82eSDsUf5GnQkWVJ6oLtPm9vwoc/e41mPSkqtOyFDD3Wx3Zv/0hbeVmBmWxgo/+I5Y49VI+G3qOsrSevQswwnqebVhWUbehxP6azlFpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217459; c=relaxed/simple;
	bh=NNw4t0j62so4mIbfyTN6wpYTjiTvWXyAzoYaDuTnz1Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fjuSQe9CDa0PfoI9gVfeXaK09pabIsN7M1VSnx8yiWi+NkCBZcssZ2xsYs7BVQDimiYqziQpJ0uuVjm0qeEsfz7aZ3SgFuANjHScU0352NZHejsiXSvUu77v+ssFH8IT+MNUlx5i9vpewodYbWYwXOkcMhV/jUPk/ULhXv7gyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=wmJzcvGu; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="wmJzcvGu"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30807ba471bso1085039eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781217453; x=1781822253; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnD5r63ZF+Pg+uk4FYDqNnxK759W7VUsLPGv0soR/74=;
        b=wmJzcvGunUtX7SQ1Q1LctiYZeDhsu/dT7wLFAYk4yC0YbuafrqvBXH8EmT+QNQr+Qy
         q+B/MNEwGMiHe7nwVPJRGk70vVdjugMLFBgD2PZJWLIkv2th962QcYOsNN8NKeLE/uI/
         VNj5SFLHlS08ddw/YTPsU3eWqfkqR5O4CKODd8tx6C/I2zmxfMXTBunqgTjxrHxNYtau
         x6Li7vlZw7kCTqlkQgIyqgnz0gm7hP9deULsJ8HDQHBVyS23sTi5uRa/5kZ4gqYT2DIL
         utfjJ5OjJx5JK0Q7hnJA+UNfXc4LURUP0mzn8zsIedL0EesohyCGr7IyIzkC6SgHFFJb
         wveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781217453; x=1781822253;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnD5r63ZF+Pg+uk4FYDqNnxK759W7VUsLPGv0soR/74=;
        b=Gzzxcle0pCgSEQPq6NI8AaDtf9zcqToaowht9EZjdzUNlEesWKLgTfxs2hheTJlHkx
         6F68mQJOZC0dwGNVvhpeU0P9Wb50SsoQd0+xb1usecIah6w/LEQKe5yBX1G4Qj40oJ7w
         Os+kR0kTeaAfq/ZB2GjqsALrPn2nOMd6hCvvJyHyTB93Qe8TewR13bw4ZMikDRYmp1Oa
         IkfDWv2f+3Xu7xjV3o3tgbGqz0qOQwS5HvcjTHtoZ9llv/cMh4WjVx5+iIqFMyNl8IQQ
         bqSm3mK4CxO/neScq1p+8l0mhkVI/+fHwuU35vUySr/VrJ4SqZtc7wzm5gsF+yG8Mno/
         dvuw==
X-Forwarded-Encrypted: i=1; AFNElJ9FlVJXswLd1oUq3Gr0QXwxgVHOcjGFYfpJOm9mpYnYqSiPDWA4zkDgkMv2GD72wrwfGcCQJQ6bOhI5b0aj8v0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+gMHSo0lIzEP937e+3q0HKnMlYcvMESsGf2NaBFvbX6wJL2sc
	E3d2k6bhLBGDU75ExtuFiWrToWhv+70CbsJNw1ieko58igmm1RU4wittnrXKDsrhfDE=
X-Gm-Gg: Acq92OFnSvfFXyzONLR9Gz1lDD4HcBUYGn8CphISlKp8jYtxaa0Ajr7Wd2ChEufT688
	1TWXFi1YomaJybm8KBYNRLaMU2psJiWjk349Hand9r71hHwx/jT15Kwm58nuNucWWlKKqKWHklT
	KuU16o1lfqG9q1peT66wFxd4jXtTapqVkoV6Eq0v2pLDcVgp+4xKcNGFxBJLBKbLraEnLhUvI2o
	wfysGaMiouo3+SZpWFED5UbauWOkjNG1XONjj97O6Uy5/3+OY5Q2Esw8omUjEpLOsP8ibhSnR8D
	7qnrnYuGSnVEoR1ZR/b4cBPMwUvbtGE48kYt6mQcoq094Jp5CI9e1juA8toKHT1/SpNeByp6GXd
	bdsX1RrOpf9C9sSfktieNPn/Q2TuY+J8UG98WKX8wMJKPwozmyOt1uQRNmIcLLUukWgph1ufGfb
	6HxmnM
X-Received: by 2002:a05:7301:2290:b0:304:997c:d43b with SMTP id 5a478bee46e88-308201e666bmr172700eec.34.1781217453228;
        Thu, 11 Jun 2026 15:37:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3c95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm696102eec.13.2026.06.11.15.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 15:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 18:37:30 -0400
Message-Id: <DJ6KW05ZSOIS.1K4K4A5CMRI8W@etsalapatis.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: Add test for sleepable lsm_cgroup
 rejection
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "David Windsor" <dwindsor@gmail.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <shuah@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260611143549.703914-1-dwindsor@gmail.com>
In-Reply-To: <20260611143549.703914-1-dwindsor@gmail.com>

On Thu Jun 11, 2026 at 10:35 AM EDT, David Windsor wrote:
> Confirm the verifier rejects loading a sleepable BPF_LSM_CGROUP program,
> as introduced in commit 5b038319be44 ("bpf: Reject sleepable
> BPF_LSM_CGROUP programs at load time").
>
> Signed-off-by: David Windsor <dwindsor@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/progs/verifier_lsm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_lsm.c b/tools/tes=
ting/selftests/bpf/progs/verifier_lsm.c
> index 38e8e9176862..2f8103bfa14e 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_lsm.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_lsm.c
> @@ -188,4 +188,13 @@ int BPF_PROG(null_check, struct file *file)
>  	return 0;
>  }
> =20
> +SEC("lsm_cgroup/file_open")
> +__description("sleepable lsm_cgroup program is rejected")
> +__failure __msg("Program of this type cannot be sleepable")
> +__flag(BPF_F_SLEEPABLE)
> +int BPF_PROG(sleepable_lsm_cgroup)
> +{
> +	return 0;
> +}
> +
>  char _license[] SEC("license") =3D "GPL";
>
> base-commit: 30dee2c176e7954f63d1fa3e52d172f30beb9bfb

