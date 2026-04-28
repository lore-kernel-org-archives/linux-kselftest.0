Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FF3C3420
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406964; cv=pass; b=p7vPRXkYaT7PSl3GfLy1d5jrjR/GDhbxRcY1YraE+VrOU6++WfiTpb5uyGvohX1xooLOUrmel6zt1hAF9FfRvndoCKqXkvvwwsZK57LdzrIgOG5BWFrWdl5IxtqXvsikBBreThZCU6W887M/MerGSFbuh+RkKoc29I3Mq57V/jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406964; c=relaxed/simple;
	bh=0W6NRYFjQGnhyQglFSLJFfyHW1vF/d8gwkB3LP9mXno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOX+If3yuzwv+3HTcIrKx33m6h+NqAgVtMwOs/rtWf26j/LTgoupnzFzw8bYUTVzytk6JiVs6znPNHgUfGeE0YwCi/nT04DCPk4OOxRB+7UmLqMdmuqRdt3LeZk+fdv5JMDkRGkClcN2NnLGiSTd41sGhi6Yo5dv+H8i36h+6Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p/9Z+PpQ; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p/9Z+PpQ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d984096so131670941fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 13:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777406961; cv=none;
        d=google.com; s=arc-20240605;
        b=immXcM09hrY+0SFxv+sonRbi5NuHxwNX/Ad9IpqnIUEbMKwZSusvZXtOhjuIrEGZ+I
         lVldjmUG+dbLL80Jft24us/4W1GYrWPJU6SS7S/W+KTtYusEhG5Bj/Yc5Ok+0+9LEp/q
         qMmSyEEA6L/asv4ybTUK8TYIeVrkl4axooWq0Q00uwzyMbtJuFi94XLPMd2Krkx3mJnL
         IT6vPRqYccCL6BmjR2d6RDxY+FNkK67lK6/UUnsdtHlvIQDXulwqkMjssvVRalIOa/NU
         lX5DhPqOQQdMnv1dCWUcUPsznfMRWy2ufpK9t5BmOC2tRq/Gp04aC1jYh4PAa4VH0DXJ
         oaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQv0iUQ29KVuQJDvZZSr4tHq4TPvwEiTETZj+a1BiUI=;
        fh=vXtsyEVjJE75/4gomEFp63SSr+fog4JCwDznpQDuq1M=;
        b=kgVQ2QI0NXuRrFmnipala4EJi5o4MHZmANllAhj7ZCdX0WpnOZHX15CX+F30qPuRnq
         SelRV2TwpapN9xkXIoO3WTn+nRf28JrGF9LqjCGd4OLW7A05m2lumFWnh/qlx8UEFizG
         JKgvcmxCebpddTU2Nj0vmmjcXMhUuZhbKdCUW7siHEFsTkGJL8rm8y5bUn3YyKEs7FK2
         3KPuUtCXV2w8GJoIA7NYy2m0STPs/HD22eEEWhfDSj5a18Ajpp6mzfB3SSVSPruo6M7P
         9K86GA80sWcRQ1nve7SHItZKOpUnSngmfv/cdY/AUNNEpdpZdWWqcKotL6HRUmyHFUyj
         P8xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777406961; x=1778011761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQv0iUQ29KVuQJDvZZSr4tHq4TPvwEiTETZj+a1BiUI=;
        b=p/9Z+PpQ6yrec7JBO4KfT753E6HJLYXDQTROSVCBj4s0HbZMvex2kPUAb63EtAb+Wq
         XON4GGDsaabic25sThJdy+jMtBDP6quOg+NI5OBvYR1y79xdoq4qpqt979WT1E3wi3xg
         bTkXhhpsgGanrJiSOmu4G6KBagliVgxTIiHFSn8gIO/FYI1QJftGysSyvDDDV3LXsEDe
         Ilwatop/XICQh4qH7o4ilvGXwS1eJG1xIOccUUzwpqxoUmrFUU6Ear+O+3QWWAeMRo1c
         XgRfrFMH5eYU0W0d2IwFYtX0c0IbGVM/TjoDGp5212nkulrSUbqGEq6IGAPbT69oio6N
         iTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406961; x=1778011761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQv0iUQ29KVuQJDvZZSr4tHq4TPvwEiTETZj+a1BiUI=;
        b=lQ2WnSl1gn36fAFTmDuSZrkKB9YSGY/YR12o7QlvfvQRuABITLiAl57gDEojiCwN+1
         VXYCXTPzvrz5aSDyAL//YBi7pbBsnw8V3SWjnsF8cuIKchkACHKenK1mIAFZMfj1SID/
         vIrMpCXRSz60HO0o9kJwzLn3zQjS3wDKfnGKDJxoEofMe/m9kjzX7FoRhQKWija+1MVT
         A20NM5XTULCULgvmwXG9ptdBl/DndI1/yL/TjI9JqKNXv9ZFrQjgNdrAB7Q72l7qqUS0
         ZpiDQQPIo14s13/ZgiJH0Q4p+oHw+eqCKBhtetSwLkqn4DJ2G94pmJ1Hb6RynJYv8G3z
         UoJg==
X-Forwarded-Encrypted: i=1; AFNElJ+bFBifCHMq4G1IMcEBuYdoCOQxAjUMmxYuGBsCCvqDteHh9nO7o5v9qO0DdEHAVa1PqgThhtQdP5lt++6ua9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE6f3DksPHEnkv8TiatC7rNYDmjQh2OIViZ79+kNHrGRXtXswO
	xlJWjP9+A+EBiENhhUlzt8ub0bbF/wRyh8XTNkRYianGBsXiq3H4YWtAx/jsYNOLcmV/0dsPu4r
	kn+URE8+lI7JIP8hMh85HglvuTA65oS6jGOUub4Qy
X-Gm-Gg: AeBDieurTWhNBbC94EeAEKnIZjfZzQ58Q/gZ3r6+rgZ/ljHCTEQTYThWO2TKf0gqmvs
	NnQqraJCc/Dc+6xBV/l7DA9dGB//p6xc3jXU7/b16CHdJ0y54KGL6w0GPRNnTSRXBkYwzoiEwwl
	zsmNni27bMv/yXugm5tCb5JKW/3vW9RQLKoZflQqH5gS1+C7zYMUY9J6so1jeDlELS6VUnoMTdG
	t97IssPwFPOA/AQukEAsodv6d1iEY+LQz1+1hrhZigzZy3EB+hR12hRgC9RA9K3rPoNyq591xS+
	OstUTJBjPMaUlZNsGXcRNnBwWIH3dA==
X-Received: by 2002:a05:651c:1613:b0:38a:2f02:e153 with SMTP id
 38308e7fff4ca-392411fe4b2mr16497141fa.31.1777406960911; Tue, 28 Apr 2026
 13:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
 <e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com> <20260427231217.GA1670652@nvidia.com>
 <afATrrjqt8zj2plL@google.com> <afEEN_4ufBcQld0q@google.com> <afEQDT_nv0kdlaBU@google.com>
In-Reply-To: <afEQDT_nv0kdlaBU@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 28 Apr 2026 13:08:51 -0700
X-Gm-Features: AVHnY4JHVYEqeuMXhTnemoCMQimOvdWxg_oIU9vE-6Z88zRvGZF-15lHQeMKZio
Message-ID: <CALzav=ecmNh6bE88oCHdmjSKK_Zpd96b84HbtmkaiDNRcotYfw@mail.gmail.com>
Subject: Re: [PATCH v2] vfio: selftests: only build tests on arm64 and x86_64
To: Sean Christopherson <seanjc@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matt Evans <mattev@meta.com>, Ted Logan <tedlogan@fb.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 12:52=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Apr 28, 2026, David Matlack wrote:
> > On 2026-04-27 06:55 PM, Sean Christopherson wrote:
> > > On Mon, Apr 27, 2026, Jason Gunthorpe wrote:
> > > > Even though this is a 64 bit build.
> > >
> > > Heh, it's much funnier when it's happening to someone else.  :-)
> > >
> > > KVM selftests went through these exact pains.  I'm pretty sure these =
are the
> > > relevant commits (the empty targets one may or may not apply to VFIO)=
.
> > >
> > > 9af04539d474dda4984ff4909d4568e6123c8cba KVM: selftests: Override ARC=
H for x86_64 instead of using ARCH_DIR
> > > 67730e6c53d70fb31618230f81c4acee9f72eaa3 KVM: selftests: Use canonica=
l $(ARCH) paths for KVM selftests directories
> > > 43fbd8cd389faa9760c5152b1c58e893c812953b KVM: selftests: Provide empt=
y 'all' and 'clean' targets for unsupported ARCHs
> >
> > KVM selftests don't prevent 32-bit x86 builds though,
>
> Yes they do?  x86 is an alias for x86_64 (or vice versa), and so the i386=
 target
> gets binned into the empty target provided by tools/testing/selftests/kvm=
/Makefile.
> And KVM selftests most definitely don't play nice with 32-bit.

Are you sure that x86 is an alias for x86_64? If it is then we don't
even need the __LP64__ stuff I posted.

But when I look at the top-level Makefile and imagine running make
without setting ARCH on the command line on a 32-bit x86 host, ARCH
will be set to SUBARCH, which will be x86.
