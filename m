Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C3249E5
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941693; cv=none; b=iP3fKtO3ylRI1Oy7u9wJLkuofx8dvWMd1i+/Eoc2mHj6rKrYLFp+ZWEiRC3yFiVCnI7sjHdQUFQR+G/CBAVuAtfRPGU/XUAqLQjvSYlJD7uIg110HMVfVTdeHlpWgKO6RHY4+Wbg05b2nkc7Ucr5UpLtn94SJBD+HOCeweB6Hd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941693; c=relaxed/simple;
	bh=m2a6CuMCos/13elBxE7xrPOeupdB2O8QuOfKeNHD2Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nnf0EWfUy0hghEV+kV0O/otbYdkykYxPT/xs6jNVs196Ei3Kbl0jtmnRXyj5THtheJvZFzlKfPi4FKabARi7tLOP+nK+DUzSOTwyBy5BxYjxuTpaC4jO6BLy+YUC8S9HkS1FnhGerPLdOYekV8+m3rNXUFAHBHQpwFDFA7zd+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjI057fn; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjI057fn"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12732e6a123so1298969c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 16:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770941691; x=1771546491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZOOjMHRTBJzKVIedfGL7gf236fJildms0DgDpjegcI=;
        b=ZjI057fn6h9yR2vnjUPjY/WBMFRNYjcB0lvj0WYarA4n5O8S0CUIPG3pMALzhbnmYh
         Sqzut951tUjbWUZk9dc02lmbBJx0XNiwLMiMoAZB51aCOnSN+1XmmZlEXCbvBZs8POZJ
         EYtlvQvTOuy5A8kFDIf5L68JoRhlejB/UL4hj7s7BLIvvIddePoDe68yomwbwuq5Z+ji
         Mqc9q7U7VWFYjELWCOv4RBPlWtUOuSkvds2xHY1mSu3JyFv6yaI6kQgxTkG2AqoWSfUZ
         MPp34XsQrBIy1v49tNXMl4AnnRBlT0cJKE5zy0AFTQIWfIfdmcHVO9qfHrPrScZ9svLv
         gDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941691; x=1771546491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZOOjMHRTBJzKVIedfGL7gf236fJildms0DgDpjegcI=;
        b=VIs9O7jJZiB5m7z93BtpRX2/fTOwg2v2FCp9JIttDU0jhGxip2J4zgSIsow2OT8UbY
         OMx4cjmgGj6s6Zlm75+gC5hiU5UBWBXtXHyhpbJM/QLAlkSET5jpVIMabdbApCwOVLBK
         sYA/0zilufkyC5YnpMcqnSnOhNg2dnwG/w4wTC0OcuHOTaqm1G5/7iLXBPdGiySqlcLk
         piuoOSN6z0+Qy1+FmM7mKsiaTRKcUddKTyT6/DVHeE6fQr4MHQpq5c/NwfHiVVBWgLnj
         TFkBft77Z8xxA4USLscuKzB1EMgrTwNIIc20ZlP8LibU5gfGTF9sUxuVd36rZ+CG1Dah
         j0JA==
X-Forwarded-Encrypted: i=1; AJvYcCX02yg+TRg/9mYytnx7Mqw+jCfG+nMAHjxFC1DIpgGx6LhhKbGLZLCkflw9w2JRxfAN1hXHrWkNTNgTl57rzRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXuGYAuwpA+kbdiYyy1HHpPD0L5J44ka1/ATdNbirK9etHa9B
	OUH0xTvgD+qNFCkMax/zgqMEteXU1/aEko2edJmto2NFfogL9Ttmu5mU
X-Gm-Gg: AZuq6aLIIbcBgyykmyKMxdcSMm1t5zneid4pfsJ5HFgRrlHmbXZJ3Tl6weSR52/z75L
	whxPnhmc1/g32+UZx/9I5Nhh9BYGeho3+KsISm1EZY+ovPt2h4/HufMrYeM/SGdJCJ1b6crZ20M
	M4ZJqY7zHaKJsX0GmsAHkZiJYRNZsi8FJppPy2hHDkPUa2mEI+T4Jk8UQ4hYoHhj8ghmZrWq5fV
	f1VPo0YE1RmBnBoGUseizvuTzHCXktBJVG45dbQGspjzOGtgGAfwjM7HLJB6cLz92x7Zkz0I1Um
	ARpYqHnsUll7k7i6Fn0JymPxUXQxXy/PFTVRDiISr6Qm+hgKhi6TF0xQ2v/rVgVehBVcCweSmdO
	VCxZx4aD65wI8h1lBiYfvaMc+E7yj9vuDwoFcNpW9WfJmbZTlZtp2LgolWx5mCDl09eZJSQPaLw
	z6mNKILmLyX24eP1HVxwN+ViOlJcB+1z/Y
X-Received: by 2002:a05:7022:690:b0:11b:7824:5c97 with SMTP id a92af1059eb24-12739846637mr323128c88.40.1770941690599;
        Thu, 12 Feb 2026 16:14:50 -0800 (PST)
Received: from [192.168.4.196] ([73.222.117.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a636095sm6909624c88.0.2026.02.12.16.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 16:14:50 -0800 (PST)
Message-ID: <e49fc187-0ef8-4557-abac-0082653fa645@gmail.com>
Date: Thu, 12 Feb 2026 16:14:48 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/3] selftests/bpf: Check
 bpf_mem_cgroup_page_state return value
To: Hui Zhu <hui.zhu@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Hui Zhu <zhuhui@kylinos.cn>, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1770883926.git.zhuhui@kylinos.cn>
 <042df9438d9e78bcd66f1fa0e7043b9ea8cda96c.1770883926.git.zhuhui@kylinos.cn>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <042df9438d9e78bcd66f1fa0e7043b9ea8cda96c.1770883926.git.zhuhui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/26 12:23 AM, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> When back-porting test_progs to different kernel versions, I encountered
> an issue where the test_cgroup_iter_memcg test would falsely pass even
> when bpf_mem_cgroup_page_state() failed.
> 
> The problem occurs when test_progs compiled on one kernel version is
> executed on another kernel with different enum values for memory
> statistics (e.g., NR_ANON_MAPPED, NR_FILE_PAGES). [...]

This patch looks good but I think to fully solve this cross-kernel issue
we should use co-re in the bpf program. In your second revision, can you
add an additional patch to make use of bpf_core_enum_value()? This way
instead of relying on enum values in vmlinux.h at compile-time, we use
the btf info at load-time instead to get the proper value for the given
kernel.
