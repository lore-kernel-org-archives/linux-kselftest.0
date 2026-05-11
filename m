Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263B39FCCF
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532295; cv=pass; b=p776/0/TVptcP1ahlJRovbTZFdVS/SPUhYcJSEcwgZIjN50FQAonv+s5+48yyeLdxHvfipPjMmOyAZ2mR32kOWGsXeOTrvL1kG+Uv1FxQFC7FYhaRXdYk4P6K0w6+0rZoP07+f8p7kfvSxGJXT10g7scI8O0xqZTdvLCV5PV8ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532295; c=relaxed/simple;
	bh=Lsx7HNxS24AkVUOKYhryh8TJ0MlTzkkNg4zqi1eTIJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vz0Z3qsgHVVzlkGX0LcsfUb8FsSTd7cO3atHwDpZOr5+RYOO11dztHLoHh89v0Z/7+VtUe5H7wtMJbSFDYoXNDvhh+2tE/1+rndKi2/nKtM5ydT4/jkTskrzNpHsbRLowaup8JqIKlyvMTiEQFRSLLG+On8JQLrO8KNxud2nXzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzKQ7LAI; arc=pass smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzKQ7LAI"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b150559bso37031155e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778532292; cv=none;
        d=google.com; s=arc-20240605;
        b=YjZJzwvWABtr0kdJtjp/QSLH036v1VxB0pK6dFEWBGcdShImKUXLSO8Gyo4w+e+WX9
         /E2mfFFqVQEAPfDmllWHodCK4VeAp+f3nDO6s+7Fy617PsLki2WjeO9fbwiI2LCJMFWd
         TKQGwcfG4wns/88Csvbni5rsBV26XnkxskHFac5tT/hJULv2LxYG1Q/ZE5uh5Bx21RJZ
         vq6WXj+NwHLOv336y7iSq0/CzxiRILegVYo2A3VH5J3SRMLaJr6DOgf3go+DSeRLeBOO
         hhKv1EVEMDJFwGj2Z0KTQai8v4KuY8uqJDblkryWYmSwCbIOKHN7bA3Ecz7PcHAMCNeL
         HUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        fh=q+tl+aCrYI0U9ucR4wklw8QtESXroxFNjI0YEWi32Ek=;
        b=fwcGe/alT1/R9kn/BspEfMjI48gOxvKNFOISDPsblscrKlBaceCB3jXsH0Hk6LbeWn
         /RvQRNK2/fQvayFOSPhcPgSXiG6c/B0VbMNMF1SaAkDbLb4ko5ZbQqSFD8wjbZf8q0An
         NlpSqjNQpCVf7+b0oqSVVXTpjRQIdiHbF14OX0c3ywoTsNDRMoG/aBAzGLFStm7f4Yvk
         b7dvbc1W9xl1Qq6lTaF4qEUdvzRLA7F7JTr3Oc4nwNijfA0127trRW528q/V+tELHh3K
         fryF8TndTZkj+xQsyTJOJqhWRtWHlysft3jNG+bf+c2wxe7uFoGaAiiq3pxzN9czburH
         j4aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778532292; x=1779137092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        b=BzKQ7LAIwJQtT0aeOWNZqHH1f+PCFAzdkmrnO2iHVUsgy+fDoAoSYkJLQZ1QuN+8aV
         9FTD2nOJjmBZgNuRqTK3zOw/q8x/FN1lKCuljNZ1blK4IdNRGvwCGTPm9D039iPQhBdH
         AkXYxkFaFN+x+V4dEwIQHUj9MpU0WraHLbXppY5p9T/UwqSWV9Rl9vOCFVI2tws3zV+r
         6weM0j8rJdUyE45Xa40aX/+evfZ+QOEWikCFYJBt6gQQ45DrW6H3Ac2gGIrICfEOc3QD
         noRTLMVBOBY3W4vodSXyfynk6OTJs59wpxk70Ng/3noQBK88RLA1q4JXQKSSqvEW6p9L
         KVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532292; x=1779137092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        b=dlPVF+sibaHqYGhvHvcSk5DBlsrDUaP7syxhlCkKwhvvDWuYUELLyO5aV9YMYrbEHk
         qCowlGWDvyuHm6aKknYxW0jRUgLJTyUOz8ogin1MSOUXXjoxVNkXC/Q/NoPbxoP6xUiR
         h3evpWPVRpJjne6oRN4rBVIf6b4qphWqWm3yYCxc0RMUjKcOoWiMK3fzxsaoKiqenc1h
         Z8QeMKK+RoFcJGxZqb8gDAGsCn6P5EZ6hmJlYM8XRImQ0SxEePYj5NmmnSovyfGRXUoK
         /9a8D/HFsv8Z1AZXhYRUa5fIWiwwba8KCjTZe9DWhXZmi+QtU34DEizKvPwsdZImAt3Y
         NulQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZPnYZKtiw6IA4eqtPNO1hLSKkxiD2DAKTDnmHJ0DSU3tj+pshwcsrD9r2C0eMz4x/1aVd3OuJAuB8J1d/nK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOZf89nTHfv243DVKaF2OCn9i+7senL1Dnd7iGCJdq0q7NYxE
	tK2i+bvTjAggvs4H9Y3zoVuz5uGe7vmRlBOzsxGoOQG2ptOGhaEGnPIDCvNNKFcyJw7QdWDZVzr
	JLieD4YGqFstJGSTK8fkZbC9Unxc8T/k=
X-Gm-Gg: Acq92OFJIb3LgQ/2S6ftpsjGIW1Lx3xCwAX1pxX5yjJx8C0EiT4X8bfhCE5829HhiHN
	Hzyjwnb2syizTArxCioIJ+6Vy8BmkSNCXYyofLqUJyNh03pe38EYVSPkLcBUif1BewgPZhmLcOi
	o592B8m+P8zOxNx2ImugT50MorQRYVk1EWV1cF+d0O86wbz6Ys+/XRuDp3r4mKhqqQCqtBPttbO
	+x5rFmTI8LGYlonK/vKEW6kx205wYoB2XcpMS5LpmDQH9Es39tin01TIhvlEukpl/d9afSx6UzY
	/7fbhFK7jyT/19J9V8T14nkoY3NG7mzGhUx8oPgUNDaCbks7NbNUMGEFYT5qaVaITPN9ogCRc7k
	8Olgcm7E4Kl7MLSYmoOggnD2rpoUmU7AC2LTne4sT/d3L912fcv5n+SYFfA==
X-Received: by 2002:a05:600c:34cd:b0:489:1c5f:3a9e with SMTP id
 5b1f17b1804b1-48e706f3688mr182545995e9.13.1778532291754; Mon, 11 May 2026
 13:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174559.659782-1-wusamuel@google.com>
In-Reply-To: <20260511174559.659782-1-wusamuel@google.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 11 May 2026 22:44:15 +0200
X-Gm-Features: AVHnY4LE3o2vqBaZVgI10g6eDtVh6QEf9MBs5iW-S47AwW-UDvT4urkZRxmTfSI
Message-ID: <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 19:50, Samuel Wu <wusamuel@google.com> wrote:
>
> This patchset adds requisite kfuncs for BPF programs to safely traverse
> wakeup_sources, and puts a config flag around the sysfs interface.
>
> Currently, a traversal of wakeup sources require going through
> /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
> sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
> wakeup source also having multiple attributes. debugfs is unstable and
> insecure.
>
> Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
> traverse the wakeup sources list, and a kfunc to get head of wakeup
> sources list is needed to start traversing the list.
>
> On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> speedup (sampled 75 times in table below). For a device under load, the
> speedup is greater.
> +-------+----+----------+----------+
> |       | n  | AVG (ms) | STD (ms) |
> +-------+----+----------+----------+
> | sysfs | 75 | 44.9     | 12.6     |
> +-------+----+----------+----------+
> | BPF   | 75 | 1.3      | 0.7      |
> +-------+----+----------+----------+
>
> The initial attempts for BPF traversal of wakeup_sources was with BPF
> iterators [1]. However, BPF already allows for traversing of a simple list
> with bpf_for(), and this current patchset has the added benefit of being
> ~2-3x more performant than BPF iterators.

This looks good to me, you can add for the set:
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
