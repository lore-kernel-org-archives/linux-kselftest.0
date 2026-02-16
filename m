Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14154330B2C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258876; cv=none; b=fkxbrNjLhfQ1QYlFc92pNDmYBVnz19TyvzqrhcjzhEu692mYrlYA8Dn5j/M+HF3e1aRkh5ifMn9+If8bN7i585oSGs4BFO1ZUJO+XPrYCEdvFzasRGgubLujkNaVAL0o3I1YCQ8KxFaA3Y5WNAI2megUUJhp0kbwOt8WbBShVQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258876; c=relaxed/simple;
	bh=vXPwT/SWHN0vRTO+ghXErJHF9bFSJOc15B0GoDaOvpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6hMbqXQJOjsb1IzV6x0BVSUL0Dyw654OvtRlZjUCeOYvygckRm5bd9aJsIfeHb2Flp21+5Am6yvozvD32pLB9BJEVZd/CNDwqW5AX9PVZxpmL5Akunz6fOFZImDo2AjCO7SfSthFgXA9kNPyzI4J6DWYbi51sJT/CM6lTjSWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiyBTLVz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiyBTLVz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2551483f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 08:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258873; x=1771863673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScvhChnO4StcvknG4EO4W1y203NmQMeHjxbNv7iKKOc=;
        b=KiyBTLVzInkMAi/CTTsBXzdtQM5xQ8uoQ1/gZGO7ei8wx1zqB9/N8cXp9hJOhprJ1v
         bjP6qMPFcbP7ISs8U64ErDBG6PjP7jIxOKxsedNWU/yx9vtnibr+Jd7om+PAle3595rx
         jx/DrLDtRajQ5a9Has6ZIpY1KBT2goL0XUaFAT8cSRiLfxyIgwzD2GxHMO7a/BzATUj9
         spTx73ENgAkWjR8dUD/FjPIeQCv0E3lLdqAFPZXo8FV3n1r68I9QxTWSMzAMBIvjgvWp
         GbMilKWU98AWOTl4uJYn8lQZTMT+mqNTCXxFKE33UmsrM++k1iY/S9gLp/+wtQzn55iZ
         2+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258873; x=1771863673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScvhChnO4StcvknG4EO4W1y203NmQMeHjxbNv7iKKOc=;
        b=q3Xxg67hrTkphGibeOxRaRi/1pfJ/X1up/jNmBquQC+MpsL+0dE69e84aXXNW5M2+5
         /Z17PeeGZNn4uGdmRi/vaDMzZAqT/luPwm4Ngz9vyw3/aHXSliftOD4Jrga+1rdIerE2
         p/MjoqHBnk1MAFSAGk07OVUQCn5AS8/uSNm4PHu288N1VlGL/Y/ey1w47abw0NMbIN3h
         XDqdvs9+Ym5dNchqA5TNxsG8CnzkOfOacOdef9noLZIGm9zzPQSEdlccXPTrAOLZiNhX
         5+U53Qo5lyic0MwonLRYV4X5ADNUJgPxNyBkYnPv6z5gK1K9zhAnhGOpkGePPgS4zN9z
         jyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0LepEsmiZUOlA1EzG64fK9Qc5MHCl2DSKagAx213iCB8XXEzEDC8pq7Z44GktnjC6DySbVaIhtMLk4tmovZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8wGmOVBxGzUwnf6t4Xq1KTpaw0AXUdWl4lfxKfEZ6O9qQkAji
	5k4ZANY0ZnnCeHHKilvIClZUNqiS+lf1kgRmMwZs3qT1n7SdaFAZbPcd
X-Gm-Gg: AZuq6aLj2yxNG4wz9eab+dfYjyMzeFFzNsL084bPN9xb35nlUFxXZF1QSvZgfxw/gvs
	fDj0FleGLaoS6Qj4E5REjo5OzVVpUUbozm24mO+Yx9hVq/oBXkHXBAeC9+/xoKEKM5u2Xeq2dns
	IkWK6MTlNxYNQs1aKRS/9607ZSaqgymxC6yWr4dh0xpHDm/BfIvuaETDkbm8UJExUiDkcg2lCfs
	VmB4lvQQ2qWU+ikAMMb6LqCWG6zNboThVwoiQDZ5EoO+AKKZJ2HWpZcjG5Aw/zMLtbBKXR1Sjj/
	lPpPieF5kkbh9dzor+YKnx3rebvlfCxmhl1pqCCT+CeoC/9gnffMgyD/ZNqoKrAmeSQPdSXx2Pi
	iE8/teF7C6HOrhP7Wt5jlWBeZsPTdkh9mVYlkeA4vw5taOQmSIYhmjzi21zfwFqw08kt97v9ePO
	8DGuT8OCksNetXjcEvaA5KBGhKgKHgEF9wufyb+uaKkDl47CL+j96h9ssm
X-Received: by 2002:a05:600c:8b32:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483739fc64fmr193175955e9.7.1771258873226;
        Mon, 16 Feb 2026 08:21:13 -0800 (PST)
Received: from localhost (bzq-166-168-31-253.red.bezeqint.net. [31.168.166.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836cd7af87sm321885895e9.1.2026.02.16.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:21:12 -0800 (PST)
Date: Mon, 16 Feb 2026 18:21:11 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
Message-ID: <aZNDSl3GPrNBGwmL@amir-ThinkPad-T480>
References: <20260212215814.629709-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212215814.629709-1-tjmercier@google.com>

On Thu, Feb 12, 2026 at 01:58:11PM -0800, T.J. Mercier wrote:
> This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
> events to kernfs files.
> 
> Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
> but fails to notify watchers when the file is removed (e.g. during
> cgroup destruction). This forces userspace monitors to maintain resource
> intensive side-channels like pidfds, procfs polling, or redundant
> directory watches to detect when a cgroup dies and a watched file is
> removed.
> 
> By generating IN_DELETE_SELF events on destruction, we allow watchers to
> rely on a single watch descriptor for the entire lifecycle of the
> monitored file, reducing resource usage (file descriptors, CPU cycles)
> and complexity in userspace.
> 
> The series is structured as follows:
> Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
> Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
>         on file removal.
> Patch 3 adds selftests to verify the new behavior.
> 
> ---
> Changes in v2:
> Remove unused variables from new selftests per kernel test robot
> Fix kernfs_type argument per Tejun
> Inline checks for FS_MODIFY, FS_DELETE in kernfs_notify_workfn per Tejun
> 
> T.J. Mercier (3):
>   kernfs: allow passing fsnotify event types
>   kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
>   selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED on
>     memory.events
> 
>  fs/kernfs/dir.c                               |  21 +++
>  fs/kernfs/file.c                              |  20 ++-
>  fs/kernfs/kernfs-internal.h                   |   3 +
>  include/linux/kernfs.h                        |   1 +
>  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
>  5 files changed, 161 insertions(+), 6 deletions(-)
> 
> 
> base-commit: ba268514ea14b44570030e8ed2aef92a38679e85
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

In future posts, please CC inotify patches to fsdevel and inotify maintainers.

Thanks,
Amir.
