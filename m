Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032E2F872
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776038503; cv=pass; b=rreQgw7Vy+HJ2CU823SpGJbGsUh3mziH9Gd78Ez3XFWSWn+6VEG/Y8H7G9YT39PIg1X9nrYmuBXu2JPgh+/BSluNKBrfwTfjKa7Mn7SdcOVOiWqhkZRiZN5AAn+JHdxt/UfcPeeilSwbiimkBrLLTciqrbrXSp7DTwMq54/fpGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776038503; c=relaxed/simple;
	bh=UykPg2QZhJz+Q7K/cGqnVHVYfJlnDh9z5GuGGnOlWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/B4GoaVa7l7TWE+flNxTDQ56cRgSihod/RmAf7vfHxW4cTXQ3LBsCx/mxVkVyRNlnQxa40RlDUpwjtjw00oN044j4adnjCK/tWavOk2xHsAfnbpAqFjYhULuwYlZ/N0dWghmkvoAZwgpn9+n3h71Jk8Dvf72GkTEATcOjzb/2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jneIyFi/; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jneIyFi/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a041eae5so27083685e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 17:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776038500; cv=none;
        d=google.com; s=arc-20240605;
        b=O4BUoK5jVIszEjXskHn/CJ3QY2Qfh/3jrgVX+eRmJFRE/0ztTpsMPsdUJ4FHKDROCC
         jMUKOGtD45MvSPNtbW35KJN2/GfTEyNqSAIc1TmMwq4M0H4PDmtOf1NLRm4TUnlyKp4J
         R3MSo77akr8oU2iJ0mYx/CmlPslfmmf6lMuc8bTLpY2k3MvEs1LltaGX0Q93vTyYvp92
         2CiTOOq/DFONWNN5BAEc2D/JZXe0de/L4oZXpnS5g1HowNbT/OHK9ebm849av5+ypu+l
         SG/mJ5DMggJzN8h9WQoUamlmwr5+fkzVrmwunhB+uRTVboMI73G7E2PruUl1zepQAPrY
         UAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1z381Ofo0rx3mIfahNjA70c0ZuNgM+q7a4xb/dSsI0=;
        fh=FuRt0mQ+xL0eyqbzCVvr8pLkSl14sp9VOY/N5ZoNaKg=;
        b=gHcpeZwILqgNLlVNqEn2F3cOpyYV0gRGrV6of6KBQNjtQXxRPfxqJ/7cADerhgdV7X
         74TE8k+4Caps9aRCvqA9X39h0EtzHcbTOQYeh26WMOaSHwh4RsBFh8H0VMDhOmPkD9mO
         xYS1XjnvdVE3YzVw9cM+UerdN20QqN0vZAWqzJKq2TNHcPMZLuMqEGObsFElqysvefMA
         FvF9EqzoaF4PvALULNGjUujek0PAYpzxF83flP4S7jdL8nQZaUfptjbkF1gwxpfHMTU1
         T1bU6ysNkn1/kp3Lfou4V2CKzTLDUOM95s1hc/EtAWLeRQgM7+BBeVXotOT/qFnLPmdC
         5SOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776038500; x=1776643300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1z381Ofo0rx3mIfahNjA70c0ZuNgM+q7a4xb/dSsI0=;
        b=jneIyFi/oPpwB6B4XiVbgXgMumz4+PEZPLcmFMfouDPIDbM1pYjmQgECOydnhQ20of
         cQSFKERxsjlaqzJzsgZ2UjjLzB3LffzDYYvLW1s98ZmJcutG5oH68ojOF1Ru60LSZoDB
         gnPLKLlEs6zLcTf+MBpfUIy1it3p1zx4VsnMKUc501jDjrGYwXBD3H5msXgK4tJeGel2
         d9RANVkS+RpMLyLPasr0f+iMJqXQuxsGYMJ7vz1GWxCOh5E3qvUBs47RyPulsrfvVCaN
         1Vz+QdI5Cbx2+rDVWQ1+KJU01BlgZPrJ+i42inzZGWXvladkGLR7dfq6N0SIUuDXIW83
         0dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776038500; x=1776643300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1z381Ofo0rx3mIfahNjA70c0ZuNgM+q7a4xb/dSsI0=;
        b=ql7URAxYxyIpnujIuGH+d9mkh2LKkaREgOw+gWmV/+FV8QKFOdHg5CVbJ37Cpk1AiC
         I3FzC1IKp8lAvM2Z1BZBO6l6/IVtAb17WkukOSJETy3XQ/lJSOH+lr2VXCar65B/pfqq
         PPfa7Ag4pnleqft5dkJOxyzNXXLU+yYS614pCNp57NUK6A3Ri6xSayHVc/2VsfYRSkvo
         RKcZBTuxt3W9z8AW+h37aZMwfed7XMriSRi9YEY37my0liAmrCCgQlNOX8H8sSV/fY++
         KMprqcpIMhz+WjoHHfdSz2RjaT2iCMfPWs9TPMW25z0OOjGYqOxXRiUrxeUPZ+bGkN9W
         Ytaw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ewUneIm9GfWeV+flmYaHPdktFehBQ3/AYfLgZ2DQaLMLeF4jURHnOiKG+lTGOP6YbV7YCnMRaW4qbR0nzJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ixfpVpm2obTd/pEx9KACkmOA+E2Ef3/Eu/qOo64cwgUxd2G1
	9XIycCUiX3MHZznCPn/jDWtLqGJXamU0OlcBSiJzR9FtCQTamw+zC+RvsdXMYXf41V/Gw4i13HK
	tqge35qF8X7HyKJLHF0moWzjR6AfZDdHyIbM6T2c=
X-Gm-Gg: AeBDievj8hL/+Qx1uP0iH1jSA986hAAzi/1gIU6rlqJXfC9C9pMxAwvDIw2F1U+dYIT
	3+kqD7g3uOQ5cQ+9AKLOBg3HlGbw8W7GHodZZtVKuWBvSegr184O4JzMzG2/xIyiatiiI85OEj7
	PTO0dHrj/SEb7+RQmAU+6I+me3ZAS7T3f08xOdlLMztcR5+/2xS49JAQRF/CxprDVGzxEFMVYYn
	/mHR8cYmIuFTgdNBz+qiwFoEqceHRoqTZcMdIzYKgrk1siQ6kuWWzfd10pxu0h7epVktcsvK0ZU
	2shBxk3KhvE+APIDDH8o6k05GwG43BU7ZM62DQ==
X-Received: by 2002:a05:600c:c10d:b0:488:ae4e:51a5 with SMTP id
 5b1f17b1804b1-488d683d633mr103247135e9.15.1776038499521; Sun, 12 Apr 2026
 17:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402063714.55124-1-liwang@redhat.com> <20260402063714.55124-9-liwang@redhat.com>
In-Reply-To: <20260402063714.55124-9-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 12 Apr 2026 17:01:28 -0700
X-Gm-Features: AQROBzCwnFa6eS6aq3Z0ozwi2axh34qQ3NZxuV-fWDi5MSnDHDQiTKyxtwF61fw
Message-ID: <CAKEwX=PWiCcyX03YrZ6GOXK4MEOhos6TrTNMm=047xApqDJhXg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] selftests/cgroup: test_zswap: wait for
 asynchronous writeback
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, yosry@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	mhocko@suse.com, shuah@kernel.org, chengming.zhou@linux.dev, 
	longman@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:38=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> zswap writeback is asynchronous, but test_zswap.c checks writeback
> counters immediately after reclaim/trigger paths. On some platforms
> (e.g. ppc64le), this can race with background writeback and cause
> spurious failures even when behavior is correct.
>
> Add wait_for_writeback() to poll get_cg_wb_count() with a bounded
> timeout, and use it in:
>
>   test_zswap_writeback_one() when writeback is expected
>   test_no_invasive_cgroup_shrink() for the wb_group check
>
> This keeps the original before/after assertion style while making the
> tests robust against writeback completion latency.
>
> No test behavior change, selftest stability improvement only.
>
> Signed-off-by: Li Wang <liwang@redhat.com>

LGTM.
Acked-by: Nhat Pham <nphamcs@gmail.com>
