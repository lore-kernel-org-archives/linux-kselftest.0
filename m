Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52EF21CC5C
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775410723; cv=pass; b=Xv+fR7iv6yZDSXK1tssmcgTdP+PBM4+zlkQdOOuyJtLGdBZUxUCoxp7TegA8eodqgAszehXsLz9PfOM8m5ph227a29ZKsJfZwcE3e0yJ3Jn7ARb08hWRFg8vbVXaom/tS8HhFehRoNTwz2lSzkG6eGIFz/194FRoW8S79/SHOT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775410723; c=relaxed/simple;
	bh=M0fGNUnxdPTPfMB+NZtRovqgahD9QFR1fhA41vPhX90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii9sLLdRx/iuQw4DwwE+XilGsDM1KyP38I0dQ9zkKY8RSaOELLiqw57HUb4D3FPgKVOM78ft/YxLLsMAZMGiJTH6QonfKHkUs2rPzwjzK569fpKxzwWiyDXmxZPQ7e4zxSMPic1dWOSD98tyj5QxncSY6bQfY8GIBr6oTF297O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUra9IOd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cTEclwI9; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUra9IOd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cTEclwI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775410720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPHyJbs4uiXMxYGli4epDavO7/1nm+agc9OgX+7C8vc=;
	b=ZUra9IOddYLypSRePj+QyaRZ9Dmp+GqU4JEs5MpsbbpXQTCPMtXTELfbfmVc8R71iZZuN0
	xAFVH/U9gcMxwmrp8c9fAD6Lmru1lytU4elGVmEmrot47hN8ZFGJH8QpwZ6qyCrnPzjbJe
	eFrvSRm4Qgp2yx1Te/1cOT18BDZ/1Lc=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-loQzm-blOTu2UvdiaMksaQ-1; Sun, 05 Apr 2026 13:38:39 -0400
X-MC-Unique: loQzm-blOTu2UvdiaMksaQ-1
X-Mimecast-MFC-AGG-ID: loQzm-blOTu2UvdiaMksaQ_1775410719
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65020d6727eso6256133d50.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 10:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775410719; cv=none;
        d=google.com; s=arc-20240605;
        b=I6WcDoKg9hsQOvb5qZoKK1Ivmm+PecgPBLkxx8ES1/xr0s2tyVBqQmDelrrBcNEkFd
         Jz4lBUe6m0TuIbngAV9qlk8OFvmJLzyMWgbsoynfIR3YmAFLEFXiFWhSXtuJ7Xh7uUaH
         bkBQdcPojBiZngc8Pj4lig/KloSikeIvtUcoKP9vkbccOMBzhKGraPoZJwf6a+SNK5hf
         sEEzAcSEN8PHGLiap7QoTuzjH2erS/zfNAs9eRHOtF5NPfNXIzIM9TnAiDhh94a46nYN
         Hwz8J5UFGwCqYH/0p6PzE/b1PUE2bYGj8dXZdbsG3Cz73UCyI12PM6ABbwaD2FwfB0CZ
         ct9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jPHyJbs4uiXMxYGli4epDavO7/1nm+agc9OgX+7C8vc=;
        fh=+I4zq4pFyrmj/16pcVltP6Ne8+5Av9WFui04eMk+o4M=;
        b=aoHunQt9SwXzErSPqREPCGepP5Pw/WCN7aMp59I/xxRAyQxRZSyJaUc4GR/y0YYaEb
         sAI/mI0wB+AekArrSiqinPaZnLOallm+m7SaumE76rBVdv8oO+Xmpawx+cPq9xBtmitH
         OCTi6RVhP1p8v2IixwPdOfUJQ2G3A//cYAjXXxNg0EXL+lapM2N/zSJSnFGTjDmkndUD
         +SQWs3SYykEN0iNCiRa51aDs838LNQz5HMycRo6FZjyDMoijUjSdRreMtZDqj+2HMxKe
         U+KRxaF8GFLoz6SY73BnxI1q6goNOxF+PIWb89NRbEI0lbETmcT0GyXwJc2s5YjgtvLQ
         Z/Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775410719; x=1776015519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPHyJbs4uiXMxYGli4epDavO7/1nm+agc9OgX+7C8vc=;
        b=cTEclwI9jK8i1yhwW5Qc/jNuyQDsKfydKPul9VKuW4T/+pZhR0wbXXqv96pDzb08EV
         SdZUT59raZtr9UtXZV2FrQ0+pg/xOef8e+zVhmdwzW4Qt1Xyf2lAZkbNsvIlcV7tx2Ct
         kYvS58l+pwJeV8vMPjlgfdqRB4OY1gL17INC1G4RzhM4CP+UU4/BhA0prxCcBAGd2SoF
         yLZi2OfI/k3TjMFGgRVzclQl9jW7A5Q3DSZzy6uHD9kK7KPEKOaelIf96jS1v6a4SFMt
         qmSNTKCyijkFRY0f9oA7nSVGkr1dRgmisQqAbHbEf+RrXTlIDSWlyo/6vPS4MuTZHwtP
         IUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775410719; x=1776015519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPHyJbs4uiXMxYGli4epDavO7/1nm+agc9OgX+7C8vc=;
        b=hgYpFQrOVN8I2U+9SBKhUAk/zzc/Ap6KN9cCbl9hEI+j50LWhVCUPIraaLqOFMDS78
         ENDrPcUhKeKj1M07oodAX6ZIKXheZLRS5ac7bFZZldWF4/cky1/zrq+Z2+F5ZpJMDMhf
         txp2O1iQHK2WyWW5NJ7AkpulZFtgDucx+ugG7N41phPwUfQ6syJVAOaqfgnx9caQbcLI
         KWSEq0e0IYBcGWtovz97kTTbp1xXCpnmjmIuXINT2hGsi2ryIgn19b6PraHmMQvXWEr1
         bMhFrIVaB74k0kTvmqC41TiiBdpjbbPWAYC1O35WPQ2zUaev78nuXWHKTc9jGkSDlk3C
         k3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5vWZwbS9dUgAHVKYcJxjbv8t9elHrwAg2HFaQnJxyjAycZuqlcU+wo8sW8kUV3xMfw1woexlXjGfYokAEBDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DGnr2vOKURJ28dHiBMelVku0ek5FOCRPx+g5yegAh5nuV/fE
	vBw0/CL08AjMhRwQ+R+0WfGw3mzif9EPNjAVq8olouKktpWI6VetQGQg99bRda5hTT/g2/Queda
	qvNmZYqmT4ukzNSm4Dnld9IkSxuCKeELXN1Wd/dtzt3e3O4z9+C5bgHDF7Cbzp+8fopMFNAJXaD
	JB0x/wtFyTpQ1KscWlHI8UAaVLVroPp/yJLUwOhagEvAW6
X-Gm-Gg: AeBDieuPCuTV92Fd1WalTYzv3oKtzlek4TAnlEQiKieJxUKCis0H3PQzqcwK7fhY5Vh
	h8ebqq646EF2RULlyFOu8q0j5Jia2dg8LtndBDhL3t3qGhxVFc0WGhnt/97u9cEA2oMh8CfO+Up
	LrOJptnYWs392+bLPVoARSABVVE7foiIsL74uMNJe4zSvFcIwEfTJuhVklF/kZDuyju5af22Dln
	fIoHxiq
X-Received: by 2002:a05:690e:1246:b0:649:c36a:a9b4 with SMTP id 956f58d0204a3-650488246b4mr9221005d50.36.1775410718588;
        Sun, 05 Apr 2026 10:38:38 -0700 (PDT)
X-Received: by 2002:a05:690e:1246:b0:649:c36a:a9b4 with SMTP id
 956f58d0204a3-650488246b4mr9220969d50.36.1775410717507; Sun, 05 Apr 2026
 10:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327014255.2058916-1-ziy@nvidia.com>
In-Reply-To: <20260327014255.2058916-1-ziy@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Sun, 5 Apr 2026 11:38:20 -0600
X-Gm-Features: AQROBzCPtZOBkOnc2jS1i15igfbub3Mq_1a1-pEjy-3xwa9Wl99L5UbfvWnok3w
Message-ID: <CAA1CXcCmue7iX3O9RLo7wR5EqASvJGCLraw1+iQMZ98BiMJwrA@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] Remove READ_ONLY_THP_FOR_FS Kconfig
To: Zi Yan <ziy@nvidia.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	David Hildenbrand <david@kernel.org>
Cc: Song Liu <songliubraving@fb.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 7:43=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> Hi all,
>
> This patchset removes READ_ONLY_THP_FOR_FS Kconfig and enables creating
> read-only THPs for FSes with large folio support (the supported orders
> need to include PMD_ORDER) by default.

Hi Zi,

Thank you for tackling this :) Ill try to review the next version as
I'm a little behind on this thread.

Should we guard collapsing READ_ONLY_THPs with a sysctl? My fear is
workloads that convert READ_ONLY THPs into writable pages (assuming
this is common/possible; my understanding of FS is rather low),
leading to storms of thp splitting. Do you think this is a real
concern? I guess this is also true of read-only-->writable fs-THPS
even without khugepaged, correct?

Cheers,
-- Nico

>
> The changes are:
> 1. collapse_file() from mm/khugepaged.c, instead of checking
>    CONFIG_READ_ONLY_THP_FOR_FS, makes sure the mapping_max_folio_order()
>    of struct address_space of the file is at least PMD_ORDER.
> 2. file_thp_enabled() also checks mapping_max_folio_order() instead.
> 3. truncate_inode_partial_folio() calls folio_split() directly instead
>    of the removed try_folio_split_to_order(), since large folios can
>    only show up on a FS with large folio support.
> 4. nr_thps is removed from struct address_space, since it is no longer
>    needed to drop all read-only THPs from a FS without large folio
>    support when the fd becomes writable. Its related filemap_nr_thps*()
>    are removed too.
> 5. folio_check_splittable() no longer checks READ_ONLY_THP_FOR_FS.
> 6. Updated comments in various places.
>
> Changelog
> =3D=3D=3D
> From RFC[1]:
> 1. instead of removing READ_ONLY_THP_FOR_FS function entirely, turn it
>    on by default for all FSes with large folio support and the supported
>    orders includes PMD_ORDER.
>
> Suggestions and comments are welcome.
>
> Link: https://lore.kernel.org/all/20260323190644.1714379-1-ziy@nvidia.com=
/ [1]
>
> Zi Yan (10):
>   mm: remove READ_ONLY_THP_FOR_FS Kconfig option
>   mm/khugepaged: remove READ_ONLY_THP_FOR_FS check
>   mm: fs: remove filemap_nr_thps*() functions and their users
>   fs: remove nr_thps from struct address_space
>   mm/huge_memory: remove READ_ONLY_THP_FOR_FS from file_thp_enabled()
>   mm/huge_memory: remove folio split check for READ_ONLY_THP_FOR_FS
>   mm/truncate: use folio_split() in truncate_inode_partial_folio()
>   fs/btrfs: remove a comment referring to READ_ONLY_THP_FOR_FS
>   selftests/mm: remove READ_ONLY_THP_FOR_FS in khugepaged
>   selftests/mm: remove READ_ONLY_THP_FOR_FS from comments in
>     guard-regions
>
>  fs/btrfs/defrag.c                          |  3 --
>  fs/inode.c                                 |  3 --
>  fs/open.c                                  | 27 ----------------
>  include/linux/fs.h                         |  5 ---
>  include/linux/huge_mm.h                    | 25 ++-------------
>  include/linux/pagemap.h                    | 29 -----------------
>  mm/Kconfig                                 | 11 -------
>  mm/filemap.c                               |  1 -
>  mm/huge_memory.c                           | 29 ++---------------
>  mm/khugepaged.c                            | 36 +++++-----------------
>  mm/truncate.c                              |  8 ++---
>  tools/testing/selftests/mm/guard-regions.c |  9 +++---
>  tools/testing/selftests/mm/khugepaged.c    |  4 +--
>  13 files changed, 23 insertions(+), 167 deletions(-)
>
> --
> 2.43.0
>

