Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873943FD2C
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786475278; cv=pass; b=TuUKPBUiL4hRLc8LRZDKPMkzTXWJAQkGKG+QA2Cddkbbmotd2w2tsfPTAlfjdMgl7BW9yaW9QlOyF++Tm19zOBEcFsTrjEnjy/mHtl8FbLpeczzb0HYlNjkXzpQlA8ESUbIm4U+YwRCp/5Ime+tPKoCUHbNSyA+eWwMNJcDSMqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786475278; c=relaxed/simple;
	bh=C1hreM4FHEoohH+eGJumQkjd/LtpSUCRmMU2uj8Ja0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLCFYu0vWggTlkAn7ZB5cLXnbnXUjlGQ6x/VRbx3MiQ4k2G9MmCB4UW7VLoMcRysWFm99vfMj3MotHt9QaY5W0P1lnXzT96p4UoSJoZlYmtZ/RaITLVlh97LOjEpdz7YojpNp9JiIzBfgN33YS3ow1DzUefMasKHevbmatBXQMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f52Q6cZ+; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f52Q6cZ+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacef7d299so22825ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 12:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786475274; cv=none;
        d=google.com; s=arc-20260327;
        b=r9Qf6QfZfKfDEZE/p8TsXgoj5RLIWZsCapZ5SD9ZXvSA9aqyrRvKSb/yibTN+VNWCn
         HV6fw+cD/xwVpoWE3WTE1TJkhq81gcKNB6TlWlVfPVUZpiP5k0JJy073LBBSKm/9HqNq
         gAlUarGMgV34LNFeDNfJ1AneElIpKFahHXnDye5gdLDsHDM7voLUGr4y3RELPWHmTWWQ
         AJaTBKH4P8OypvsD47+VCiSDY5GNVQ1IZthiOzjvGFpEJELgl2bRDIr2dtpuaWddsc5+
         vZJ3sR4ONhc6+9d6K94gSDb3tJi+WUrWTtbjUlKWsFNUjwDcR5XU44kIXwqVM1H1aJcD
         992g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C1hreM4FHEoohH+eGJumQkjd/LtpSUCRmMU2uj8Ja0M=;
        fh=yT78FJUJ8Wrw+AJGsqNk5XJU15qOMfomo+cBydpaZ+w=;
        b=geuWx/5+lgYyRh4ThjX0UJ3/lXYZVvrIyNrCn4vtcQOZj+Fvx9F0zRR3yYX97k7ka8
         Ac3DQs0NjkHr4lQ3iB7hWuX3VIVM4443zjR+4uek2AlzmSTH0dLltvVyMN1dnBpqQ/aK
         jeRPbPVaOWJLJo/3dy7CWO0kLjEO5JDebdaqBNfRkUrm3B0l1VgZdy+ghw2uhLKUc4me
         vGuxjXcX6Umrkxh61OzPy18XAs36+Y0IeBOSPWH+bUPMLj0iz8CO5ZcBIUqrqMUftQRW
         YJtIMIEC6JrXXWwXDRNcV1JmTtf+xIBmQImMPyKYuyZURQDl51A7rfcqHjrByEzXvRZu
         lSsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786475274; x=1787080074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1hreM4FHEoohH+eGJumQkjd/LtpSUCRmMU2uj8Ja0M=;
        b=f52Q6cZ+pga+sW7FR+YhQgyATx0vGbkY9yFhTJof/GW8VCujYo3OQ9f1omJuccegHZ
         52Xm451BQfwvRnU0k3mpvbRtGgHaFXM+4HbiLD3StuwkwSUaI8DncAz6CmS/M5cY0EnE
         pzN7hcYfAyqCYNfokleRmnMie27iOCqIUFo0/MA516Xb9bYOaM9ZB5xlc0Thf1BDkR6M
         Xv4oiQnymXumR4l903+9cQwKiMxhrRjz690VdOWgq91JHYAjiqWs0dvcGCGTW7aMxRX+
         thvfs1XxLMGjiEO/QYgoIPuftMRmLVpN8u47OIM6PO2DkJzXde6jgxlMrY0YqfwJviGW
         A+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786475274; x=1787080074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1hreM4FHEoohH+eGJumQkjd/LtpSUCRmMU2uj8Ja0M=;
        b=WDXmC2fH70Sk8PV674cWgcP2Pvlyn6iDct9mrv71OAaiwwsN0Cf2urViqSgvRwgwC4
         JmV0yvYMjtyEde7zS1DV5bdxcUE+UAnbZohK0hNuYeQXzBThX4WHMGJClS6iD/eWRcz/
         8XmyZHGOoWRKj7F1WeyW1qqfQHpZgns4764U6seq2ZLQQRfgabm7j4MkKSWdkRtqQabQ
         yUkeEC1I+fPSoim0fz6I9T3sCGu2A9exgXjfz24N4DbcCgP3BxRGK9E2m2CdxCqB7LMI
         u/VmYyOuE0ulpchsLERhnFxh8YTrbGKbidST4/zY8/vIPS1ghPOK+G++nRirUf1mcYlP
         wysQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX+aDS7T9kOi4HTbB21if/wpX76wV1UYBt66K++Lf2ZbYYBjQDKd16AcXc6oSVlRgCQXIU7O6TyMpiS1dI654=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx768KruUwCXlIbpIcHc58aNR37pNfxfz410o+V7Nx/yeUd6oxo
	zFWkruvHksCgIu4bpjsGLTaLmZz2/VafFzwbO+9n7v4PQe5JXZjg6kLsxP1fnPJ7RtHN03n6rie
	7wUwy72TCI89pIuoP7tk4BiLEYFMWFmYPtosW4qBi
X-Gm-Gg: AR+sD12DdNS89ELZX2GY93xuJF1oYcCfCpxWPAzfNs4zq1Q29YOaUZKewmdGABrYq/v
	tamfTGy1zpgvzmaBEkpbj+B2DuUQyaDvwj1XCZuoS3EbSsUGGjglC0Pf5gufaa1nSuYy+y2Bwob
	J4LBb5Z4DzLYH7X2S8z1aGX2oz+2tfIp2df4+kmNTllJCwORtHPz6QAkMSiu3nEfeRc2lGk8xa5
	Ym1v3TZn/IAmDubEUFWiu6QAWfW3DAYZ1UVH5WWbtB8Krwd5b/uCdF5+I2tYD0o+s0Lg0LzH0iK
	7/Fh12nSbBVo+pafYQL425pInefZ+prU9UYtNsDMKbTWAR/K1Bd7OycDRwY3a+0iAB1yLIFrMQk
	AMvc8kP8eekYOV+QDaxYzdjA3SBpYgXA=
X-Received: by 2002:a17:903:1843:b0:2bf:3579:cdaa with SMTP id
 d9443c01a7336-2d33a99905amr481575ad.10.1786475273937; Tue, 11 Aug 2026
 12:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-work-coredump-sparse-v1-0-cd3e8b1e356d@kernel.org>
In-Reply-To: <20260811-work-coredump-sparse-v1-0-cd3e8b1e356d@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 11 Aug 2026 21:07:16 +0200
X-Gm-Features: AUfX_mwl8D17qLmpn2j9POaLRIWa5xMeaCP1oLEBxMsBs01SgCKLca4ifFR7LFM
Message-ID: <CAG48ez3QwUopEyfB0tEc84A57g3GZdnptazJW+htiTi2e0Gc=A@mail.gmail.com>
Subject: Re: [PATCH 00/11] coredump: allow to create sparse coredumps on the
 coredump socket
To: Christian Brauner <brauner@kernel.org>
Cc: Jacob Lalonde <jalalonde@meta.com>, Josef Bacik <josef@toxicpanda.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Omar Sandoval <osandov@osandov.com>, Jacob Lalonde <jalalonde@fb.com>, Shuah Khan <shuah@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 5:27=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> A server that raises COREDUMP_HEADER in coredump_ack->mask doesn't get
> the coredump as a plain byte stream but as a sequence of frames. Each
> one a struct coredump_frame_header followed by what it describes. A data
> frame carries its bytes. If a server also raises COREDUMP_SPARSE, zero
> frames are sent for unpopulated mappings. They only indicate how many
> zero bytes need to be written and to not include data. Reassembling the
> frames gives back the same coredump. A debugger and everything else
> still see an ordinary core file and nothing outside the coredump server
> has to learn anything.

Hmm...

I think what you're doing is probably the easiest way to do this in
practice. I guess some design alternatives would be:

1. (overengineered, not generically useful enough): If the transport
was a pipe (which already has the concept of different types of pipe
buffers) instead of a unix domain socket, we could introduce a special
representation for zero-filled pipe buffers and some API for receiving
zeroed holes through lseek(pipefd, 0, SEEK_DATA), but that's probably
not sufficiently useful for stuff other than core dumping to be worth
the effort.
2. (somewhat overengineered) With some refactoring, we could maybe do
something like /proc/kcore and create a seekable virtual coredump file
that we send over the socket via SCM_RIGHTS?
3. We could leave the userspace memory dump out of the core dump data,
and let userspace take care of filling out the memory contents using
/proc/$pid/pagemap and /proc/$pid/mem? That would also avoid task
switches and SKB allocations, and probably reduce the number of data
copies involved in this by 1.
