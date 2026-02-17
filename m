Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A62D2481
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356327; cv=pass; b=PGYba8QA5ITmMhfX4yCWDwYzr9YgpNTURYCBCtjsowJyK2PZne/ts62MeW2nbjSulBdwTypJ9xnHPPl//MbNGjURJ1ytAcyIc4CgxZGEWH6sB3GKay+w4vse9NeQh9ugdcOjrwWCD0d1SbFm38TmMTAwiQNjYhMA0L2VqgsuTNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356327; c=relaxed/simple;
	bh=sewE/sl1jGzvTdHwbA17sP0tHhoksdxDyaxVGzvfzrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFcYHin7oWmGgJvC8t3wYy5K5zloj+P602krcL1okTduZY257NdW2eQC/TyW1VYspwFtG/zGLvKdKTUUxJJ9y90nrxak3s/kCpXasl6YEf26IQvLVuZJ/DhRvNFaf2iGpQOst+PQuNr4gEmKoXNKVV0Ujl77HtggbgMxCceviUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q59LI2Zx; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q59LI2Zx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371d2f661so8075e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 11:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356324; cv=none;
        d=google.com; s=arc-20240605;
        b=OUH/b0WiWU0uqmHOQv1aDjqQR2D3ziAnBJnkrucG/iXCqDtWnqN/ph1G2KtdeDtfo0
         GmKVzwSMV+QcioC+oe8P047lbz7tesV/+uf/VFg+Uhh0+cU/kVfUCpiF8qcgQIEEP3Cg
         DAhs4wNb3VEYzd2p9U1LaoUofH9PIqG0c0CazNlIG7HLn9Lhl1uAsIhW/uGSLmtX+lFf
         UdPF1w6JKYBKB+nbKBU0kqnNLVcTAlX8NyLkvE49Np36cxNP8y9bRNZQuue3Go/aYrP8
         gspHlUy6tyTF2IOUejIacRj1n50yhcY9GdRKTUIkYz7x6Th1Tb3FUBYJiXm5pV1q4zVc
         ASCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        fh=Kwaz0QYLoXS5X3T/eU+UiERsiusD+CP4hNM8AjInti0=;
        b=QWBlCgvIkvFwp0f/zTFaK5Mph2DG3QCk4O5G1WrSGFZf1Vugyg4jmMMq23vySFZlJO
         mMNiBm9YLRE0WyOc3ixcv5X40xzdJtEhEBsP596tn0Wp21uW8k1MeqS+1+od61uWvk4w
         1Tp6VMGcuNFZfCCwq7qygSc6/AcPUy8eQD4qTCvE6n5M1klFqa0SaVaj5MJo4aEv6kD0
         WKVC2e89BlmzD72EnP7Tkgp8qzN0Jq+l6OEMomI5n/ksKjlSamq1ODG0rmVszUBjMOHX
         j8SCWrvwZNSCsblce0FnFTAPtEiQ96YY9ueb1IL4BuV2O0g+pbMP9Yf6gRldSamqs90D
         B5Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356324; x=1771961124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        b=Q59LI2Zx9PcAYnnZjqw+/AHHQ1HZChY2vm8f2vJc9Vid22Svfgl3trmEjuZUtWCViG
         EcjCxZi+TWL2HSyDcqYRG/x9s3IM6FWH6lNz/X3Rk2RUvdMzMPvQ0au3zA6PT9FKGvPe
         N7qRSrU/Qn7x38gmZFsl2npPmg/cmZLW24ldmBLBIa5+DLKeA+VCH/AHhdS8HuKScwGw
         5u+2hJHo3XwEkCdAGnxCRwiIDjF+RnT8AaE4WglFf7VzEO+iJZ6efsD11paeNHKi10pX
         P2KuyXJAbXD7kpGCPZ05qo+dgNHEYj8aFlL+jX+aoxfJ/KyBZr2ZQSRUiAhVnnY74uB5
         pBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356324; x=1771961124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0ibeNCc7R8HXhy/DdkWxEPCCxKLgy5A2bxR1yxzMM4=;
        b=YsHLuHLbULrA1JIE38Grz63n8rd/5dczgpxmxwGGHsh2/wtZwkzZOwny620tlKS9mL
         5xIcb+ezP2Pei90wM+2VO2Xf7KpuJqBdirVGrYfWW0BGH1SX5tmdLjXt9B8CSYwlgxG9
         TWJ6yXjMfHtvnzJYe+PZfXXkNBS0HhkufIgs+y9IFkIZeveWbVZ52bLD//vUsqMS37V9
         WZ6LX9bgzgmas4x/CNtNrDqtCJHINO/yo5UQiRC8BnW/jXw1Hq0ysXeSGNiEhx3Z+Olm
         93kcDvcbPdLL+ZBcm+AnYyfU+Dyn1D9qdgeNbvMubozW6y+xG2XlUslBcq8e3RqOpnHn
         L/eg==
X-Forwarded-Encrypted: i=1; AJvYcCXOZxRa5di0aJ9Gspl4eyZv+GXW9X23DtkzQtgtiKO78GGVLHAZg+ma9k4D6g0vEBVaxwkI4XJxvEZ0RiyrNWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvfrv13yywGRBzuCGMGfL6tb/aEptLAVsyfqTYrFNHhwS5qyA
	b+QaUYILdDKfPe8dUact3aIeFJV2PQwSH0ygxa3qpRn1EMHUjccxB369Yyra0N9urICrYD/tncs
	dOIrTW5ObJJy3XQaZXx4RTX8pJztrV49fJ973ivIe
X-Gm-Gg: AZuq6aKI4rhaxoCZjwGWgHVcjr2I+z1OwVYTobf7xX5fRvXZpgb7MvFGBYyvHduN6qD
	1hIEkdePWIAQgGS94Njf7kyKTl39n0rFuLmQlCk87ZuZNB3+PldAOKzBBP/iGnTr4ker7b1Df5f
	2IXcyObRWtmO3asE+QCfjdp0diP/Vi+UJfvwLi8SubjdYAY+dkdT9C8JQMkcyTEWP84XLYLRxTB
	8kNJcCUtEcXhWQiheJ2JyjpeM6y39EV8xgialeRTE0I4hQjmp9+yx3jyfGU2hUU3KeHvjpY+/nj
	xe3bAPbpGVmB86i8sG9ryMb3M7kehokRBbQvbRydrQn2TD4JpUe5gJ+Oonh3oHhpcg3x0A==
X-Received: by 2002:a05:600c:63da:b0:480:4a7b:228 with SMTP id
 5b1f17b1804b1-483885e39f1mr1287205e9.1.1771356323780; Tue, 17 Feb 2026
 11:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
In-Reply-To: <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:25:11 -0800
X-Gm-Features: AaiRm53P6sMj72saz2iRJgcKdNr5FDsRWfFewzT5upX4tAB-ZB6-gxFZCLtvsrU
Message-ID: <CABdmKX0CU+bOVDdq0V50TfP6RHr23EJj5XeA_e66BC45gLDsFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 8:21=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Feb 12, 2026 at 01:58:11PM -0800, T.J. Mercier wrote:
> > This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
> > events to kernfs files.
> >
> > Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
> > but fails to notify watchers when the file is removed (e.g. during
> > cgroup destruction). This forces userspace monitors to maintain resourc=
e
> > intensive side-channels like pidfds, procfs polling, or redundant
> > directory watches to detect when a cgroup dies and a watched file is
> > removed.
> >
> > By generating IN_DELETE_SELF events on destruction, we allow watchers t=
o
> > rely on a single watch descriptor for the entire lifecycle of the
> > monitored file, reducing resource usage (file descriptors, CPU cycles)
> > and complexity in userspace.
> >
> > The series is structured as follows:
> > Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
> > Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
> >         on file removal.
> > Patch 3 adds selftests to verify the new behavior.
> >
> > ---
> > Changes in v2:
> > Remove unused variables from new selftests per kernel test robot
> > Fix kernfs_type argument per Tejun
> > Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Teju=
n
> >
> > T.J. Mercier (3):
> >   kernfs: allow passing fsnotify event types
> >   kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
> >   selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
> >     memory.events
> >
> >  fs/kernfs/dir.c                               |  21 +++
> >  fs/kernfs/file.c                              |  20 ++-
> >  fs/kernfs/kernfs-internal.h                   |   3 +
> >  include/linux/kernfs.h                        |   1 +
> >  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
> >  5 files changed, 161 insertions(+), 6 deletions(-)
> >
> >
> > base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
> > --
> > 2.53.0.273.g2a3d683680-goog
> >
>
> In future posts, please CC inotify patches to fsdevel and inotify maintai=
ners.

Got it, will do.
