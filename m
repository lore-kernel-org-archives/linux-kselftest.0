Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6F242D72
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787271010; cv=none; b=UyHvaJFiD64M9HQ+bmaeLSR4CKk/U8CfI6n0EC4Glh+v4WwlyanNVNdS1ov3Co4iXQcgV0qe9YOR4Sv9whIeSZ6hZHq94tDSrlu6OGuPkyIElFDDthX3MyDb0zy770QvKGOBX7OLRVtbjzWfk7BkG9pXnKLz3ry66OLBb84/pOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787271010; c=relaxed/simple;
	bh=YvHQ3miz97Wxhsdl2DC3IX66HonwlBnObtoGpVg9ojw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k12CvR0bbQlZ+utQx/ymdtV1kJin1muxw7BKqatlEXcIzG0ml+3Z44b7I9Mi1H6b0fZjVTGOVEQb5W3o0Wn5nZB8EkYpFQ2NxFQceKHa3KDC8y73iBWqghKm/J60thsw+gMexsvZ0HRrydoyLFWaqxzxp+UMM7g9lNw9wNgy5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdk8XnHE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdk8XnHE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso317377a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787271008; x=1787875808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mnGSxAPxWvCyoRHnoU9zYBh0C+WPKLEGOxSgVj9dJH4=;
        b=kdk8XnHEqzDjcwYb6Ml1/DdqRWebguNo/dSTGG/PAO2ZoJPY1ojAphLKgOA+dkP7aO
         FvawOX3CSk/ExuKhbttSCaKW+STGv/sstGHx6xivXcQ6+RpiBBDgH9xnw9BLoPeHZAfj
         3LQTt600MlW38I5s+ckIGE4V33WoWLhmreMKa+6mtMFFNIHUJnom62Mk3Viu/IoIBRsg
         gFyKQXye3OMtQwOZWa1y+Rz1rdI/sDzlw3sNvjlPOzWYTFg97w026WaT8XfKjDtZnCYZ
         8PnPETnSMFQvZnTAYxFciz31Ul26DACsdT0N1vZ7LGiBXeZBXLQqwfEd3NzUaOn7z9mA
         C6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787271008; x=1787875808;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnGSxAPxWvCyoRHnoU9zYBh0C+WPKLEGOxSgVj9dJH4=;
        b=o+UWNp80xOWYtiLVPkmCnf+S/32p7kHLnFa9pAsKoZlJq/Fr6F+YnTv1gwJIM5KUEi
         sCvKR4Mivw46udR2Skbt5j9dGpSV/tj69jpPbZK2Pllnu1lwfK5wyZig2QuMtsFji1Q+
         AzT1dktGgYvgD6jmutr1SHyeG07Xcg2Gsh9o9dIjfx15rGpmUVLmQNmXpmysFfAgJnsm
         EMqbgE4u81Qjrx+1FrvtnDkQV7V4rLfWFbKbxYHDuNrhclySgU1m7ZrELblagUhNIQy8
         jcA98yUw0gVI6GJ9OBHtcfS5ubjiT5apD5ZMy91EIdUGf7Tnx34jdC9cbHQsHgGUijJr
         mJGg==
X-Forwarded-Encrypted: i=1; AHgh+RpV4Ij6cX7OTAKWXUjbSD4DNCPzeL5wGwQnSA3N/LUXb5l225/Gr3U+AsgEIeR85s2JeFE10h7FjT+FZGMxFOA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4bzwimkFduqlbnBCPEkzBxK3Y0HPCSEukrtB28qe2G1GjJUQ0
	QdgByDRlPJHAFtNWLruUCZPAwrXsZ5d5zpDSAYjl2ksYxHc18O1gsluz
X-Gm-Gg: AR+sD12CUJqNEY0rqCcy2YIBWOKW5Ep8RswMzXoNhfwHGaV+B1KUnAcu5ztlQi1+mtv
	xKs25c1+RURrFTu6OjEmAT9/9bHKFFT0RbI9aTIOfc+/c1mHhhgMvNf/D2WBKO2vjLrg1Lv16fm
	/7l9KkN7Y4ITUa4i07r+7ufMr64dqP+xWjM4Gbv2O1VxPqpfThifZv3KZY9U4WGoEl4idA6cIDw
	Ym7WLL4Er96Ws8hvyFldR6/Rck5iU0xmbP2ufSIsDKs7CJbxpy5yoDF4cmRYuGVJfliobRI+bcT
	wKQ5xlbld6ZUvRt/bga5K7d+NPEPBFka4ZsE2QOr9MESnV1xu8Ci07wpbDm6lubINOvNg49UDF2
	/G8gsAw/QbMC/VVuZTp7ZPCje3wcchiu1N3uDBEFLcqapUMyNz+W4TgyApijJvAxDp4L+XHegjb
	1z/jXxWJ36jaA3N4XQtksN9u6eUMOsmS/9W1SSofJYnT8rhM8uC10MDrw/iqPoKpAEl5ID35zwh
	a7YAJM6ZH6zcd14hYREHENWP28+06hcm514lCL2PQbpWQ==
X-Received: by 2002:a17:90a:e70c:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-395a074d955mr13842390a91.20.1787271008165;
        Thu, 20 Aug 2026 17:10:08 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:89bc:48d2:9457:6223? ([2620:10d:c090:500::6:c5ba])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ac3d1bfsm19054586c88.0.2026.08.20.17.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 17:10:07 -0700 (PDT)
Message-ID: <67d62b1943b093ac1eb16c9cc1ff38e0d5eda72b.camel@gmail.com>
Subject: Re: [RFC PATCH bpf-next v3 2/2] selftests/bpf: add tests for
 selective kmod BTF loading
From: Eduard Zingerman <eddyz87@gmail.com>
To: Fuyu Zhao <zhaofuyu@vivo.com>, bpf@vger.kernel.org, 
	andrii.nakryiko@gmail.com, alan.maguire@oracle.com
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 memxor@gmail.com, 	martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, 	emil@etsalapatis.com,
 ihor.solodrai@linux.dev, shuah@kernel.org, yatsenko@meta.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 20 Aug 2026 17:10:05 -0700
In-Reply-To: <20260819090426.267-3-zhaofuyu@vivo.com>
References: <20260819090426.267-1-zhaofuyu@vivo.com>
	 <20260819090426.267-3-zhaofuyu@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-08-19 at 17:04 +0800, Fuyu Zhao wrote:

...

> +++ b/tools/testing/selftests/bpf/prog_tests/kmod_btfs.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <test_progs.h>
> +#include "kmod_btfs.skel.h"
> +
> +static bool btf_skipped;
> +static bool dup_ignored;
> +
> +static const char btf_skip_fmt[] =3D
> +	"libbpf: skipping module BTF '%s', not in kmod_btf_names\n";
> +static const char dup_ignore_fmt[] =3D
> +	"libbpf: duplicate kmod BTF name '%s' ignored\n";
> +
> +static int libbpf_print_cb(enum libbpf_print_level level, const char *fm=
t,
> +			   va_list args)
> +{
> +	if (!strcmp(fmt, btf_skip_fmt)) {
> +		if (!strcmp(va_arg(args, char *), "bpf_test_no_cfi"))
> +			btf_skipped =3D true;
> +	} else if (!strcmp(fmt, dup_ignore_fmt)) {
> +		if (!strcmp(va_arg(args, char *), "bpf_testmod"))
> +			dup_ignored =3D true;
> +	}
> +
> +	return 0;
> +}

Idk what Andrii would say about this, but I'd rather add an internal
function akin to:

  size_t bpf_object_btf_module_cnt(const struct bpf_object *obj);

in libbpf.c and expose it via libbpf_internal.h (*not* via API),
instead of intercepting log messages.

...
