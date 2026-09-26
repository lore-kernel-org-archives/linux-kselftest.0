Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675725B091;
	Sat, 26 Sep 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411702; cv=none; b=YVCAv4n5+1GvQMBZfFNZd6C+wDUz11M2xMbi4VRerAAbh66HMyl1y3NjOqq+PwpkkW9Dx0V3/QervxaGC9pQ6coqOGgKS/26QVAn17WoBRIghVRnU493IJKceH6laPRGNwr5YgB8HvPfmih6C4uoebpZpKT2MNp6CcGJshyq3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411702; c=relaxed/simple;
	bh=NzEIaAozYlSXXvCSG8F3Q9Lfk3SbQy+S17/CybfVKd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8ZLmI2lTv8RzENc7pHhVafTqtD9i6bGRy3vxI8/Rbs8jUP9439ydF7hwVkNBco/lTaYryFt4HL4vfn7dxnNjrbdFhWAqnQj0QziQx1hJyzisa8yPGE4IQapIjhu++/YH+sObBzPIY5PjmokhNpfdRotgqdSmB08PL7Bh0iaRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKI4YSoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKI4YSoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1282F1F000FF;
	Sat, 26 Sep 2026 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790411701;
	bh=/oS5cGci8QiKs9/+vr+9VzvkfNfCYGybORMZp8o7zYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKI4YSoIet132l4ifkQSXpJ5S/HAo847RXSPWXlIA//sS1T6DGjDQTSrpmN9w+Kk8
	 js4BixlSkmCw0FEiWLxPcvGxE+3BW6mUpaVXp7XnIRL7QdFfavBtgd1//5Iee5neNs
	 RbienQhHQWLrliSen8LuKxiRtjLuTujrUWtILEs7n/v8uXZzy1skEP7wNx/NpddT7Z
	 GKDAu4WaRdM8Gb/v3pq+XXSFKIL8eKYWfrSN8F+Oz6PgY1dZcpz94w2o4EId72TGE1
	 eqRFZeQmkE1AufPSMNNHLAa7nmcdoN/3AKwfCX7m1232ogKRodq5xYHa7hRr5g9vD9
	 B4sDgFN4Tljag==
Date: Sat, 26 Sep 2026 11:34:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Maximilian Huber <maximilian.huber@tngtech.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>, Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Askar Safin <safinaskar@gmail.com>, linux-doc@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v3 0/2] Move tool for generating initramfs cpio to
 scripts/
Message-ID: <areDq-1iFZUViDgS@kernel.org>
References: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>

Hi Nicolas,

On Fri, Sep 25, 2026 at 09:29:29PM +0200, Nicolas Schier wrote:
> initramfs cpio tools had been subject of several recent discussions on
> linux-kbuild.  Let's get two minor steps forward by enabling a
> top-level target for building gen_init_cpio w/o the need of a valid
> kbuild configuration [1] and move the tools for generating the built-in
> initramfs from usr/ to scripts/ [2].
> 
> Link: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com # [1]
> Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/ # [2]
> ---
> Changes in v3:
>   * Update various remaining usr/gen_init* references treewide (Nathan)
>   * Link to v2: https://patch.msgid.link/20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org
> 
> Changes in v2:
>   * Build gen_init_cpio only if CONFIG_BLK_DEV_INITRD (Thomas)
>   * Keep underscore top-level target name (scripts_gen_init_cpio)
>     (Thomas)
>   * Link to v1: https://patch.msgid.link/20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org
> 
> ---
> Nicolas Schier (2):
>       kbuild: Mark usr_gen_init_cpio as no-dot-config-target
>       kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
> 
>  .../early-userspace/early_userspace_support.rst          | 16 ++++++++--------
>  Documentation/filesystems/ramfs-rootfs-initramfs.rst     | 10 +++++-----
>  MAINTAINERS                                              |  1 +
>  Makefile                                                 |  9 +++++----
>  scripts/.gitignore                                       |  1 +
>  scripts/Makefile                                         |  3 +++
>  scripts/Makefile.package                                 |  2 +-
>  {usr => scripts}/gen_init_cpio.c                         |  0
>  {usr => scripts}/gen_initramfs.sh                        |  2 +-
>  scripts/remove-stale-files                               |  2 ++
>  scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py     |  2 +-
>  tools/testing/selftests/kho/vmtest.sh                    |  2 +-

There's also tools/testing/selftests/liveupdate/vmtest.sh I know of, didn't
check for other users in tools/testing

>  tools/testing/selftests/nolibc/Makefile.nolibc           |  2 +-
>  usr/.gitignore                                           |  4 +++-
>  usr/Kconfig                                              |  2 +-
>  usr/Makefile                                             |  4 +---
>  16 files changed, 35 insertions(+), 27 deletions(-)
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a
> 
> Best regards,
> --  
> Nicolas
> 

-- 
Sincerely yours,
Mike.
