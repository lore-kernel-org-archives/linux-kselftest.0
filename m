Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261720;
	b=gMn9Kon1fNpZdEZSDAv+gdFBJXqxYHmmvQwdR66LknW/zUEKPIZA0n9UQdAmUdQzsr89
	 /hM/aaZxi7inNLDxpApI2LUNTG5B2Y8DC0ELPvmocpUgI1UgEffTL40iyY9eMJIbj+rwW
	 93fmizBFTugG/7FSkOMtpSKtsGSUQY+ezookxg0+NymWfn1Y2KS+GpZtBFNdoGc2YK6k7
	 yMFDxxF0Kjcy89CDfJmZrJZy6Xepwt85zZQDdULfzVO+bIHD+qX1hbmsiL/m/PqVUIbiC
	 jFSUcxM8frmLRq7NlMllRTUu6KxYAIRvvrjt3+831QM2KUcI47pbGyFT1rvC7L+Xpfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:User-Agent:X-Original-From:References:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
	b=YVdQBICypjY7x3ndzgul0GrBgxRDtl/J+DWmHI6Yhj7mlrDrF62lMpKTGQ9vXr56dQg8
	 e+8m6zkBwtsiw0ygdY0WR9NR+RCmn9jmP2kycgqcd+jdJ1ZaiIRyClMSMewC0OIVVGkN5
	 Ylo/CvXbPrg96Vnkd0e3QMsarXYdXBibcym3urGdFJ6cR+FAeZbh3ZVQ1J+hDG6709K9Z
	 s+BFzqfOpjcT23k+6OJZ+UWUkaYtBQMCQDZzMtiwhVTEWH3+LfE0UdSzZsQSUBpFCbCod
	 JrUzdNJnLe7dCq0pf5sj3gZ99K/bhIcsUQm8qQNeV52uXI+CmRrHjvvX5E7t4wJtK3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AA606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1489286a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 01:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261714; cv=none;
        d=google.com; s=arc-20260327;
        b=M6uhe/zjVLxBq5RxQv8DPQMASl+LAY5e6qUGXnbTvh0XCSoJcB8lHIYONVN0PmDswj
         iVoxoVpZq/ysdDOWb6JPXWq0z7CJbrFZajSD3gy8jPzHOFHMkD5v+7gGjgO+Zmok4TQD
         /rFppPfaxbgzgZY9HenEpapIxaL39VasrvLt1tiO5jBMT1SlCN4sBjILeCthLVaLrTMa
         dQG2gPC4nYnmf4T42BfrcyWzhk284KgcYXLauHQecxXPY1/qZ8TEbdXXZoYILlggubDJ
         ZNxXXOL/oScYQ6E6bttHm+0Qfbb1iG1XR7fXFLa0+anelJRmDuJ8ddpFtI6pdrAj1LyK
         0i1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :user-agent:from:dkim-signature;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        fh=Sh40w2ZEU6AQZSbNXjYhYbacSr6KpUX+1Q6TxR0V1xM=;
        b=shQWf/RlFcPsM7xwv/hEu6NSTRVp2whU5HQpGkkET4jolypIdX7r9cwAhsxQ5ma7S1
         /8KlbCcQCjhNZr5qNrs5Y/IdRezrhGKVO1/S3QZzF79EE26WvHE++PA0QAjF+TPmaD7J
         WGyTHjc/Hm63xQPZubpMuzrOtcQ6hS5qNHog29NF9HM0qHqVXCxcfUuxfKIxxd2RuesN
         DVxc+EeTlFIccb0qDvMpf5HbR4nXNWF5lRrWMv4qnRP4A44grTkKv92h2UHLOSrO6YyR
         yiXqoSoiAOzZ02EjQ06fjO3n+Ry0efi1rmtXwO7885KQxc4um7+OEZhptaugJhlnVYlK
         oI5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793261714; x=1793866514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=RFI4zuaCnjf0fN5tmtBIH0lhUxmF5UpTQqI0bfI2MJ62zdrjSQoUtfKJemeQNxuLMT
         NN9a/1T+6gwPT42Q2S0zE5NokPyuA/PXaghdfrs2kAawogxGcm3jZekQYMkRO4pA4gq/
         DUPJb+yu+jrfBPnSQlr19DYYvE73xW5bleANLI/WN25oQzFOCPbkJURptYuxPecPkOgb
         9+XQUwYi6ZOwVgPgHs26aeQSPy2FvOkwQdVoAzd7U7w5BU9vTnox/GApfw1Ube3nSUJt
         kTBY7z68hwvB8/OV2Thb8A4WM7AVMQCFW7CL+jJRC42ITMx78QZ2rRMGEy4uF6S35MZm
         7rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261714; x=1793866514;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=w3S1zIIOLOS/QnAoLU/f4eoPUI0XumPUWJhilojjSKrvFK6L0VgdlxJCkd2vaC3ZSo
         HmLI6DzGf5cE8BvaYM4XQ2dZdGmPR+Ey0wWlQxgtc+p9oEgfq9x5nCaP/9zss0yg/lGb
         RccJdOVnACKua5zzUgNhcbjtasnPz0PGBVBw9uhAEuQ8GgecEp64vtyUiJDyZ4xV9Z8e
         8yS1FNd2IB6HVBnMGOg2Urxks2TKgBYLRElHlgQ56vJiurFCKb9/jhqI41Jgd2dZln1I
         iQJu2QE23XO44tRLbaWZegn5P6MMgkTu5Xdzvn7Q7T8OvtCuXOluENYpfGLyoqh39Rgd
         jVAw==
X-Forwarded-Encrypted: i=1; AKwUvBz5ZpcE67eToHnDj+cIuGrfP8VIyNzOWSrHNO5QSGz2mZxyouJEY2hBtthvFgylNhzziX9hWl6fYRVJHxATFos=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxIwHdupyZchSubUWxNhXkLaby9vTVEtf5+n4S5Q+ezKVMq/ic
	xcb4yP10b561p1PrvPwOT28ob0GymcYpNag/xtItmXpu0STyjHWtgwMcsoDcsOKhW79eDh3e8k6
	QZmzHnbF/MnCXDC9j0HIU592wJ9M5+ssuhMZtHDTqCQ==
X-Gm-Gg: AYBFou03be3Lqx0ibO1GZX5fZnjn1Pmcm6I5/ThdbpFENP3CFa5hVqzsgsdHUJEfpU3
	kMJJTHSF7bSiGBqOBRWrUC/w+l4GG8PjUZ13d4TbaScO4uHtet++kGZZAEsmQ+cfYfTEpXKNo/l
	spTJzkDI10kjCOxmLycBT4s/MkGR2gl3J/zRKEoPz7tq5ND7Woe/OQLcjdf3w6ImDLjtTWA3zn4
	ngR5WAhcijZ5oBzmG2+SXSYbLf61Dwa1Ai2C2oO4CItEUouUoL0oCE9gs54EkO6ziRPoXM7w6/u
	hTbq6H7f0IhIQPLMhR8tcYRsEIfBHTGuuHaQRYHFiDy6We7SwPeZZ++dS5G4ZdLFzvCLhoJEkls
	OlWOv7fa0FI7i+iS92HbeHGFKwWTxQgx2UeYdx/Qq19WWhky8RCRW2G7bsw==
X-Received: by 2002:a17:90b:1644:b0:3ac:bc3d:6fe5 with SMTP id
 98e67ed59e1d1-3ae57df3d9cmr3792452a91.7.1793261714053; Thu, 29 Oct 2026
 01:15:14 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com> <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 01:15:09 -0700
X-Gm-Features: AclHuK_f9UmrKyQEn9kevLn5RZ0DxR6jXXwQ6CxrknwZt6gPcFhXWT1BqyQH4Dk
Message-ID: <CACnXVndTuZd8jyVG0=KEq1WicQ4iCA22_TkOnSMyrtbTD+ybWA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi Himanshu, Paul,

On 10/29/26 3:09 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
>>>>> [...]
>>>>> Paul, please hold off on taking this version into for-next until
>>>>> these fixes are included. The rebase and PMU testing are useful, but
>>>>> there are still outstanding correctness issues.
>>>>>
>>>>> I will consolidate the changes and post v12 against riscv/for-next,
>>>>> with an updated changelog and validation results. Let's coordinate
>>>>> the next posting to keep everything together.
>>>>>
>>>>> Thanks,
>>>>> Zhanpeng
>>>>>
>>>>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
>>>>
>>>> Regards,
>>>> Anup
>>>
>>> I'll post a focused v12 before this weekend with the immediate
>>> correctness fixes. Further improvements can follow separately.
>>
>> Linux-7.4 merge window closes end-of this week so your v12
>> will be too late for it hence I suggest sending incremental fixes
>> separately.
>>
>
> Hi Zhanpeng,
>
> I agree with Anup. IMO, SSE as a feature is ready. It will be easier
> for you and for me if the patches are merged. It has become a pain to
> send revised RAS patches because of the dependency.The issue that I
> identified can be sent incrementally in coming weeks.
>
> I would request Paul to pick up the SSE patches now.
>
> Regards
> Himanshu

SSE v12[1] is ready with the correctness fixes discussed on the v10 threads.

Himanshu, I checked your posted RAS v5 series against v12: all nine
patches apply cleanly without modification. V12 uses the same
riscv/for-next base as v11, so switching the dependency requires no
changes to your patches.

Paul, please pick up v12 rather than v11 so these fixes are included
from the start.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/linux-riscv/20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com/
