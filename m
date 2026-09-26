Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C7376A0D;
	Sat, 26 Sep 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790445085; cv=none; b=XQb4FBLIREtqEEMxphESzASqjiPpbrIq/JT0cnn/JAH2qTVPJmVVfUfAVR2pJgsGYO93D5LFMLkCWu3W0DlAyRhIrOecwCvakq7odE0+iBc6bR67z40Mka1rac8k9PQVa3SSaOyNd7ylmfBQZJOX8Zl4jSSJbNkAt3EybKeQiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790445085; c=relaxed/simple;
	bh=dJkwSRcEIBWdPO5DP6xDMu0eTRcPeYjoIpVQnE38tvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co6raVDtdVFmdLMZNUNorzWcsgAV8jjK2urgazAX2IpbqH2w1XVHocFGHSOJFDk+jP0naOyyASY21kg7a+x5fG3+4oFstK0RSpNybAN4Vg4UNEQ7WkgUaR533MCXljdVgaKY96jUqnCQ9nnRBtd+X6XSgtOYhN+7C6eAkGUwoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DD1lP/Qm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DD1lP/Qm"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 197DC1F000FF;
	Sat, 26 Sep 2026 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790445083;
	bh=+l/+xlFQ9oYX3AqDOoZ5UJ8jLQiMbyYFqszTxwXHlbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DD1lP/QmC7LYXQVPac1ZErbOX+o9gC185enlv/A+acy3P/pDC5ujo9X8rUfjkldPJ
	 pHSHH1d+F9mBnfgX1o5XEdguQtswWEoO3h1vMpYyye82Pzp81Ofebc9rm0+H2/yEAj
	 ZUmV1JJTvoVd3YYUEgqmzt2MnYZi+AqKPTZgSG0MNZ+f37aK6ZQ4DGXqbfndr5bsto
	 d/BlkNHkO3ehaXRHohpz/SPENa/i18vrn2bs2CQiK8THJZPujfZ4zC2LJYm7dD3Qnq
	 v75aEO7w1UjPmERPWOFujS6zGWAaO6BkF6QCOFcgPbGzKAKKMFZgqeLYHF87qLF4CM
	 NF+O3+M9SQfjw==
Date: Sat, 26 Sep 2026 19:48:16 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <argFYF12qS0REcAP@levanger>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
References: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
 <areDq-1iFZUViDgS@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <areDq-1iFZUViDgS@kernel.org>

On Sat, Sep 26, 2026 at 11:34:51AM +0300, Mike Rapoport wrote:
> Hi Nicolas,
> 
> On Fri, Sep 25, 2026 at 09:29:29PM +0200, Nicolas Schier wrote:
> > initramfs cpio tools had been subject of several recent discussions on
> > linux-kbuild.  Let's get two minor steps forward by enabling a
> > top-level target for building gen_init_cpio w/o the need of a valid
> > kbuild configuration [1] and move the tools for generating the built-in
> > initramfs from usr/ to scripts/ [2].
> > 
> > Link: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com # [1]
> > Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/ # [2]
> > ---
> > Changes in v3:
> >   * Update various remaining usr/gen_init* references treewide (Nathan)
> >   * Link to v2: https://patch.msgid.link/20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org
> > 
> > Changes in v2:
> >   * Build gen_init_cpio only if CONFIG_BLK_DEV_INITRD (Thomas)
> >   * Keep underscore top-level target name (scripts_gen_init_cpio)
> >     (Thomas)
> >   * Link to v1: https://patch.msgid.link/20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org
> > 
> > ---
> > Nicolas Schier (2):
> >       kbuild: Mark usr_gen_init_cpio as no-dot-config-target
> >       kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
> > 
> >  .../early-userspace/early_userspace_support.rst          | 16 ++++++++--------
> >  Documentation/filesystems/ramfs-rootfs-initramfs.rst     | 10 +++++-----
> >  MAINTAINERS                                              |  1 +
> >  Makefile                                                 |  9 +++++----
> >  scripts/.gitignore                                       |  1 +
> >  scripts/Makefile                                         |  3 +++
> >  scripts/Makefile.package                                 |  2 +-
> >  {usr => scripts}/gen_init_cpio.c                         |  0
> >  {usr => scripts}/gen_initramfs.sh                        |  2 +-
> >  scripts/remove-stale-files                               |  2 ++
> >  scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py     |  2 +-
> >  tools/testing/selftests/kho/vmtest.sh                    |  2 +-
> 
> There's also tools/testing/selftests/liveupdate/vmtest.sh I know of, didn't
> check for other users in tools/testing
> 

No idea how I missed that again; will be adjusted in v4.  Thanks a lot!

-- 
Nicolas
