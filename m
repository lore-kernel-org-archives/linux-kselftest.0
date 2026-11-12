Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526140;
	b=FfblWOcNZn2DTUexaqaQAKwOVKpwEd8fRzoKiMK3dpaR5UfNX3m+5sX25zqv0CsKGJbH
	 EuMhfA0OD1kargKqnij9BNN1ssj6/1tFm1erNxomUIhEoLizilI8Fgozq5yH/VrQm0e+d
	 WvGI96sJH3NkG1i/kNnn5bSGiPZa1toJ6BpPF6UwXuX4oz0r0A1w4N31n3OlcBfsX+GJD
	 AoTfX1Y6oVezN0MtSetrIRxucSevjmhW2wARkBDeRsH4z1gi55uC1P1etex4nxad2IYyT
	 JRn4XoomMVVQc6GELo9VEqAmxcRmxFxUFU2IFzU6ova2Hy6c8djr8Wl02reIjscjUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=2cs5M1nOu5DURbvfTYqdzXq3V+MLFS0qjnccfeZqcI8=;
	b=Dzcl3N40TL3hUTYQryURoCtDBoMdxvbxnJ4FasWarx8crLKNtKcgiA9J22rDCVeImeZR
	 egvSOR3QAA6/tPAnUSuCgBkRb10hOBzmZhShoYlEm3gQibqkIS45xULykqY+Db7xYyl/I
	 tfnvifdji6UsRQmkbjeh5vj7CXgGGJyfo2D+4YxWbmN9E2Oj/lm2WrUOQ+FG5Qutw+oUU
	 LDwKXu+k0SGEAiCP3bRDmsd7nUVv1GPGY3A1nHpgHicEpj0J6PJ6GBw9h913C6nJs4nce
	 7kt1oE6GWPckZYJ45DsJybAQ07zyeobh3A3TzKbrpLxBBEH7Zr5qPR11BwFUj9dTdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=IS299qSH;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59014606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 23:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=IS299qSH
Received: from smtp-4-0001 (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jQc615fC5z15HR;
	Fri, 13 Nov 2026 00:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794526137;
	bh=2cs5M1nOu5DURbvfTYqdzXq3V+MLFS0qjnccfeZqcI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IS299qSHMPdrB9sAhccgm28zbGTzeC4YNbvUcbkEu0kFVDzwk1BIoUiZgix0Y8d6/
	 hVoMF1ZEHlqT0vEUTwLAkrAnXd65WCPvM4VgmS7C4jIjA3DirS/I4vN0GkQBfnDXT1
	 cEdurAFwmDaSyWMY9Puk2P4ao9iRA9ZtzVbzLS40=
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jQc604RymzT9j;
	Fri, 13 Nov 2026 00:28:56 +0100 (CET)
Date: Fri, 13 Nov 2026 00:28:56 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] landlock: Clarify implicit handling of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261113.Ahzeu2seey4e@digikod.net>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-4-2b405fc1b3aa@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-4-2b405fc1b3aa@gmail.com>
X-Infomaniak-Routing: alpha

On Sun, Nov 08, 2026 at 09:23:51PM +0100, Günther Noack wrote:
> The LANDLOCK_ACCESS_FS_REFER right is handled implicitly in a ruleset,
> but only if any other filesystem access right is declared as handled
> in the given ruleset.
> 
> The old documentation was still a remnant from the times when
> filesystem access rights were the only access rights that existed in
> Landlock, but it became misleading when we introduced additional types
> of access rights.
> 
> Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
> Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> ---
>  include/uapi/linux/landlock.h | 17 +++++++++--------
>  security/landlock/access.h    |  9 +++++----
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> index 24510e5d8479..7e38b9d1bf12 100644
> --- a/include/uapi/linux/landlock.h
> +++ b/include/uapi/linux/landlock.h
> @@ -22,10 +22,10 @@
>   * enacted.  Vice versa, access rights that are not specifically listed here are
>   * not going to be denied by this ruleset when it is enacted.
>   *
> - * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
> - * by default, even when its bit is not set in @handled_access_fs.  In order to
> - * add new rules with this access right, the bit must still be set explicitly
> - * (cf. `Filesystem flags`_).
> + * For historical reasons, as soon as any filesystem access right is handled in
> + * @handled_access_fs, the %LANDLOCK_ACCESS_FS_REFER right is always denied as
> + * well.  In order to add new rules with this access right, the bit must still
> + * be set explicitly (cf. `Filesystem flags`_).
>   *
>   * The explicit listing of *handled access rights* is required for backwards
>   * compatibility reasons.  In most use cases, processes that use Landlock will
> @@ -462,10 +462,11 @@ struct landlock_capability_attr {
>   *   This access right is available since the second version of the Landlock
>   *   ABI.
>   *
> - *   This is the only access right which is denied by default by any ruleset,
> - *   even if the right is not specified as handled at ruleset creation time.
> - *   The only way to make a ruleset grant this right is to explicitly allow it
> - *   for a specific directory by adding a matching rule to the ruleset.
> + *   This is the only access right which is denied by default by any ruleset
> + *   that handles filesystem access rights, even if the right is not specified
> + *   as handled at ruleset creation time.  The only way to make a ruleset grant
> + *   this right is to explicitly allow it for a specific directory by adding a
> + *   matching rule to the ruleset.
>   *
>   *   In particular, when using the first Landlock ABI version, Landlock will
>   *   always deny attempts to reparent files between different directories.
> diff --git a/security/landlock/access.h b/security/landlock/access.h
> index f9eaa2f53686..c4a81f7dadeb 100644
> --- a/security/landlock/access.h
> +++ b/security/landlock/access.h
> @@ -18,10 +18,11 @@
>  #include "limits.h"
>  
>  /*
> - * All access rights that are denied by default whether they are handled or not
> - * by a ruleset/layer.  This must be ORed with the .handled field of all
> - * domain->layers[] entries when we need to get the absolute handled access
> - * masks, see landlock_upgrade_handled_layer_config().
> + * All filesystem access rights that are denied by default as soon as any other
> + * filesystem access right is handled, even if the access right is not
> + * explicitly declared to be handled itself.  This must be ORed with the
> + * .handled field of all domain->layers[] entries when we need to get the
> + * absolute handled access masks, see landlock_upgrade_handled_layer_config().
>   */
>  /* clang-format off */
>  #define _LANDLOCK_ACCESS_FS_INITIALLY_DENIED ( \

This is good, but it should also be extended to
landlock_upgrade_handled_layer_config()'s and
reparent-exdev_layers_rename[12]'s comments.

> 
> -- 
> 2.56.0
> 
> 
