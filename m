Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D451548C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755257; cv=pass; b=F/GzkTyYBANOrsyeAFXeSueYM+JTuo47lUHiKUP8F10ddklGyZ0C5TaxYAMo2pH4NcYNkOEtbnacQY/d4I/DhtaefQmDxIDogo09NJt94Q0MkzACzGuD1gaYVvc//UFFGFQAKukjfQmsnyGCb+jsW+AfZw6QzDkt6Ixny7+olm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755257; c=relaxed/simple;
	bh=jRsauYAb/O8R1mJxxt+mtRx4RCCMNAsS80SQg73kaeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzsHDhpgZYVfQCpXgOjxLuakPNKs9DFRo9IQ8TkzHV1be95SolQnDh1urHp7or54orFgGciqBPOHugWcPaUzJzBbtprAbhhAemqUcIcy0Qf+EzzeEj7+k1yOqtVP9Am33ZD36Jy27NS85X3apJHKc+AcO5A8qAN51EDqK4LG0fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMwDGPXh; arc=pass smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMwDGPXh"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so3217993f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772755254; cv=none;
        d=google.com; s=arc-20240605;
        b=FvHQmCj/kSXa2zbARLNNvSdcVjq/CfGxVLTH0sABd5dJcHoUG/QV2fhAH/NgS6VZzh
         Qe9lksM/Qe05kXzhIaZGl6fuFuIY4WPdh1S8BpXfsf/FT6nf71pfhiZA99axN5jsTpwa
         8hPq5mXF9nGwUTSwI4N1AeMUMC84jUlcvaUAr3f+j6F/8c+RiAvJ+HkGpdcjk4cUwT4n
         q0LGjOe1b84kyLWC50D57Y6d+j8e6P53rXc7N/+Fw4kW6tk+Rc/EoS9voLgZ/jsmw95n
         rn7r7BuXah5M7vt+SxSMouq1Vh0iveV6W5DDlXT4M79u5Xyb28klsP1S7onwisCembkI
         ouiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jRsauYAb/O8R1mJxxt+mtRx4RCCMNAsS80SQg73kaeM=;
        fh=rdu533xZOvkkv2jATK8gSnk5Q1Y8soEYLyCX4GhBdDg=;
        b=YXzf7zkJSjo9yvMwThtv4C5H+ot5EMY/jGaHM+C7EkQMRG+j2ug3+5rBKP1LKxuz4j
         aPhluSjLnvcA6vuQsKHKnzSDbi2ZmHalJx3yv3C0axndoRkRDP9zcBREYeN7XwT+/cpe
         MdwLv1lqeU2FcRNexZ57OCR9xsBiajzZyv3ZwQ8sxA2DYVvaAwar4tcoCLqwFabSVkbc
         QJYV5Lr+tL3eRqzKThBhVmM1eDyuAdUQ4367t2dbEdl9EomHXpC3iaIkvpfg0/e6wOjb
         cm6KX3Kk7nO5fua73jb967bRk7CiXDluUBZGhX2XX5piUJK/7gmhstYB0f6WV4DwxoHK
         8I7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772755254; x=1773360054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jRsauYAb/O8R1mJxxt+mtRx4RCCMNAsS80SQg73kaeM=;
        b=PMwDGPXhXa7oAUQmvP3DxY0vy/tIGpK0VtYm3jZQMFLb+3sEwOGd+A5Dsd/x5wMf5X
         bnWVLfDRm/EW7Vv+1G23dHYwwGUk6jukH70Nn7f0aTZbi4Zz6i69i3Jdt/EYdk5ipvqn
         oJ+eBzQ5RhOigLBKqdOemysXQw/ZfZ+Iflx8LMMftvE33mxxQV7I0Mr+bwjX6A/CINJu
         ADl9qV2CQS6fne0zRNULcZiNp9bBtNsAOnInFo7QKGB3lLfWW6+sNWurdjDgmtmD0ssz
         3jsEClSHopINO1J3UydVM1eW3n2UBKv2MNQY1Gh6833Z2/8srtLlnLk0cx/dh5HHDnDB
         mKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772755254; x=1773360054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRsauYAb/O8R1mJxxt+mtRx4RCCMNAsS80SQg73kaeM=;
        b=tSxdcSL2bcd1ERdyIxVC4Oy98F1z9vmzhLwgAk2ydINBruPSZN+w8mwoiXIOqLqa4q
         Kf4QlUbJQrQ2FEYgRFmUcidPbYl6zoI+InWEcSkq+2pnJNujEG2s0kBvKoc1S+7bzvI3
         7D2EajSeOX3CEk8nDuqgaEizxQp1faDgxZbfHtlmCLUu5UCzEfPFIjAdryoSHn9KxJGG
         iedCEkd1PTGAr/XacevP0x4au/ikN6IH8yUdXnZrO+Y545MmqVINRnZBdIpViyTc/LEH
         BQKbjq2OIzwu76sI/xCJvKdvC7w8kzJQh4QNgE2QAUrE2B73H4zQRxMaNSotcgOzd7Yp
         ZWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVXiSMi6HfJ4hO0vdEY0j3OPLueziHwvWvg1EkkD/2RtzdlZVPeB3kgMKnxsZfBDkmgpDUo15UJDMKPf+/T+ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiqcTDiN1bUKU+cdPmNG4IoyNTPcdwZITkJmyGrxpbzryLlmz
	rQTFJz6Gp174Vpv1X3fhsGCvf+QGxdZHJnzK6CXie9R21Wg8BgP/OApeOhsk76roEmdFnbIa8hz
	xnmMAjxeGw58sBAy1Ldk48nI+JEw+5d8=
X-Gm-Gg: ATEYQzyWf2XqJmDgowDxgtB+BDJkNb122ms+ooO++YUYs2kUpdNHpi24oFPRysGqoHu
	xPDnZE+5KFM50YItjzKug/PWxuwm1a0EXnYP4SoWPcnSshueToLu0zeXtHeCQKYY+t4IEwJZTJS
	jZKGIBs+6xKMiZtP4QkhDe1UIIkOmEqd4zXAqbRSsjF3LZmSyjOVTM5YGuam22lw03xynhKGWN1
	H7ArR9jelyb1ylJPDYqJ4xd8/NEImaGu6ylSuZxdaGg/3TskihZWvVlYBRf2j+x9unj9lT8fTLG
	04newuLEuaNj9O17rgqDS8g7k08K7p/YILDYDKzuvK562KcYBsIEzna+LaQ=
X-Received: by 2002:a5d:5c89:0:b0:439:c42f:10d3 with SMTP id
 ffacd0b85a97d-439da67c522mr251928f8f.46.1772755254397; Thu, 05 Mar 2026
 16:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-1-pilgrimtao@gmail.com> <20260304143459.78059-2-pilgrimtao@gmail.com>
In-Reply-To: <20260304143459.78059-2-pilgrimtao@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:00:17 +0100
X-Gm-Features: AaiRm503-nblu_Zv4HuBZcLkUaQYpUNSpcsO_swTkvFKxfix8qqgo7AO5qFDAns
Message-ID: <CAP01T77RgXhG_Pc6qhxdksMSpm07YhEvtcooEzz4boYv3+6GqQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] bpf: Introduce the bpf_list_del kfunc.
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 15:50, Chengkaitao <pilgrimtao@gmail.com> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> If a user holds ownership of a node in the middle of a list, they
> can directly remove it from the list without strictly adhering to
> deletion rules from the head or tail.
>
> We have added an additional parameter bpf_list_head *head to
> bpf_list_del, as the verifier requires the head parameter to
> check whether the lock is being held.
>
> This is typically paired with bpf_refcount. After calling
> bpf_list_del, it is generally necessary to drop the reference to
> the list node twice to prevent reference count leaks.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]
