Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395944;
	b=TE6jQVfDgq5fQ+OsNPML3V8M/TyQUPm633jqoNcVrlqkRlsiULi7emV1Gz/DEpF4klnn
	 TMg6XKGtYylr0v/OUyI/F1f9/qLulnfHBMptFA6eyolsSWj6lJ2zZC+IqGCDhsHQ4MSN7
	 bvzoOKsH6cPFMLuLjq4j4EjJqvmif1VP/JYUYjWrfR+jQ2AgHvmMme9XpIcF40dxQz1no
	 Lls8383wt1vRJA8dH8n+Wwy5mGmxFKPMecZYsMTdwTc/ut5xGoTFUCXdlW2p/JRayGUDG
	 LwW+Gm0SSya2fvIpdQouMIQkVxR0hRafFF4fSW4Sn0DymVPxtnHR2R0d0wN1BFD1THQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395944;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=qYip/S6YR8HP6EPMfD+DO9PeevjFwxYNpr2ap+wiblQ=;
	b=jGtjrdJT+8nWt7J/QIXdbNLJSMXbh6PO5+Smi4Vo/SJXXNefqL6ZNefabp4tgP3RHzFR
	 MUhP7frAhXtovMjm1tpwG65cFuDi5PQzkVwXC22Ak1S+nJgeAfVNPxe8K2zao0PxvCW9s
	 D0U/9+BOUdt1kbJqx8+95vMRyxIKP+Z3F4W+Wc0GfYtgqfpdiUVIcaBo7MFixbEJ7G2Je
	 9DC5+5p00R4HUcXgqi7ofnaEp87KlDOVJDRxYdTFx2yDi6PGzQB+tIivDa3YS+NXMYB7C
	 S6vO47YG8fEfUOT6bplBq45mOucj1DcLeS/+bKa8YVDFAC1VH8kS9SwiJjKyP8k6v5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqzS3vcn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62F606A324;
	Wed, 11 Nov 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqzS3vcn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333081F00A06;
	Wed, 11 Nov 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395943;
	bh=qYip/S6YR8HP6EPMfD+DO9PeevjFwxYNpr2ap+wiblQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GqzS3vcnCAk7RcM9m0TvajMcoWIE5tsCDTZDcdpms/zdOpMd0QJB+8k35zijIKLZ/
	 9zMZaltBrIBk/p9iRKmL+q19QJxxJSkV3ewQwBIpTKZBwK9WP2DepzICMR5JH/Rfgb
	 cxRWRVFpuNsMg1wugipdX3i36sBiYPJU+Km+w1Sh3SlIyRUAbg1+kNi0/VRpuax7jn
	 kap/zpwjdpfDyIKPvnNqMuePwSyKJVfA2mFNJO6kaLwq8EuveY34RPGKhFDGjI5eJX
	 fjk3pYjwjTrr8JpqdZaWbLH3WZnmoPAcxQUEL9vzgasoinjwD/Iy2Z5AlIfhdD6xt4
	 GAckGa/L7Ow1w==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 vipinsh@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 rdunlap@infradead.org, graf@amazon.com
In-Reply-To: <20261105050053.3063001-6-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-6-pasha.tatashin@soleen.com>
Date: Wed, 11 Nov 2026 13:18:40 +0200
Message-Id: <179439592041.425130.6098227055493441109.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Currently, LUO sessions are frozen automatically only inside the
> reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
> iterates through all outgoing sessions under global write locks and
> freezes them serially during shutdown. On hosts running multiple
> workloads that quiesce one by one ahead of kexec, userspace needs an
> explicit per-session freeze point so each session can capture final file
> state under its per-session mutex as soon as its workload pauses.
> 
> Introduce LIVEUPDATE_SESSION_FREEZE on session FDs to freeze an outgoing
> session early. The ioctl runs .freeze() across all preserved files in
> the session and serializes their metadata. Once frozen, no additional
> files can be added to the session, and subsequent freeze calls return
> -EBUSY. Freeze is only valid on outgoing sessions and returns -EINVAL on
> incoming ones.
> 
> By default (flags == 0), session lifetime remains bound to the session
> FD: the session stays frozen while the FD remains open, and closing the
> session FD before reboot (for example, to abort the session or on
> process exit/crash) unfreezes it via .unfreeze(), unpreserves its files,
> and reclaims all resources. During kexec, already-frozen sessions skip
> the late auto-freeze and are published into the outgoing KHO subtree.
> 
> With LIVEUPDATE_SESSION_FREEZE_COMMIT set in
> struct liveupdate_session_freeze.flags, the frozen session is committed:
> it and its FLB dependencies are immediately inserted into the outgoing
> KHO subtree via luo_session_publish_one(), and the session survives
> close() with full ownership retained by LUO until reboot. Once
> committed, closing the session FD (or another session failing to freeze
> during reboot) never unfreezes or unpreserves the session, allowing
> processes to hand off preserved state and exit prior to kexec.
> 
> Update the uAPI and core LUO documentation to describe session freeze
> and commit semantics.

Please teach your LLM to use shorter paragraphs, focus on why and don't
list every implementation detail, but only important ones.

> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  Documentation/userspace-api/liveupdate.rst | 30 +++++++++
>  include/linux/liveupdate.h                 |  3 +-
>  include/uapi/linux/liveupdate.h            | 46 +++++++++++++
>  kernel/liveupdate/luo_file.c               | 54 +++++++--------
>  kernel/liveupdate/luo_internal.h           |  7 ++
>  kernel/liveupdate/luo_session.c            | 77 ++++++++++++++++++++--
>  6 files changed, 184 insertions(+), 33 deletions(-)
>
> diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
> index cdd74627ab75b..d36537c556ccb 100644
> --- a/Documentation/userspace-api/liveupdate.rst
> +++ b/Documentation/userspace-api/liveupdate.rst
> @@ -22,6 +22,36 @@ change, so compatibility is not guaranteed when kexec rebooting between
>  different kernel versions. This is expected to change and stabilize in a future
>  version.
>  
> +Session Freeze and Commit
> +=========================
> +
> +By default, LUO freezes active sessions automatically inside the
> +``reboot(LINUX_REBOOT_CMD_KEXEC)`` syscall path, and an outgoing session's
> +lifetime is bound to its open session FD: closing the FD before reboot aborts
> +preservation and returns all resources.
> +
> +Userspace may also freeze an outgoing session explicitly ahead of reboot via
> +``ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg)`` once it has finished
> +preserving and modifying the session's files:
> +
> +- **Freeze** (``flags == 0``): Executes ``.freeze()`` on all preserved files in
> +  the session under the per-session lock (allowing multiple sessions to freeze
> +  concurrently), while keeping session lifetime tied to ``session_fd``. When
> +  ``session_fd`` is closed before reboot (for example, to abort the session or
> +  on process exit/crash), LUO runs ``.unfreeze()`` and ``.unpreserve()`` on all
> +  files in the session and reclaims all resources. As long as ``session_fd``
> +  remains open, the session stays frozen across any failed ``reboot()`` attempt;
> +  at kexec time, already-frozen sessions skip the late auto-freeze step and are
> +  published into the outgoing KHO subtree.
> +- **Freeze and commit** (``LIVEUPDATE_SESSION_FREEZE_COMMIT``): Freezes the
> +  session's files, immediately inserts the session and its FLB dependencies
> +  into the outgoing KHO subtree, and commits the session so that it survives
> +  closing ``session_fd`` with ownership retained by LUO until reboot. Once
> +  committed, closing ``session_fd`` (or another session failing to freeze
> +  during ``reboot()``) will neither unfreeze nor unpreserve the session,
> +  allowing processes to hand off preserved state to LUO and exit prior to
> +  kexec.

Too wall-of-text'y, too much markup.

I'm stopping here until v6.

-- 
Sincerely yours,
Mike.

