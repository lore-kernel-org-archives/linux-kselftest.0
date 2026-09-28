Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FEF4D9F62;
	Mon, 28 Sep 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616796; cv=none; b=oLQ26vPVIjjgEltkPeysnyBn8XVz9/hPzkj3yrrDpdvy5s53gJZ/jKoeDOrGVQ5gH5u5RauZIentnGPpRLOsE9t7aCOKOdaOt38QHzOm3CwTMdUbhsZDgCtLggDbXu5jUxZ/XG3Klex30Zx/DIJi0lSghVlUUAhwA7NGgTB4Af8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616796; c=relaxed/simple;
	bh=C8kGbKfsI+FMcV8afys+z8UNd4GWjbh7+SCvfWTuSTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k8gecQJSyev2uz0xrSET7+9ODSD6/BB+DaGiD4W+KC+oKDsqYloWxrX/HQ5QseM/hcbdLEz0COvQIC6S0+ByTG03QuysWohkMwRhdTqO/0cOJboFvzKmk2nP8WvuofZwxvFOqSeAvNpZ4n66D8R1XiaDnibftpvungJUYkoxaHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA++G6Ke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA++G6Ke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338DB1F000FF;
	Mon, 28 Sep 2026 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616795;
	bh=ZZAMQYYiiCkPWOPSajMdbfju4b+8ZMSrcWzT8+A/DzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IA++G6KeWHo5KL4bWJkkW5kJ8rbX8uqYdP/N7/J6hUzwwPck9BMUiXbG7dv08mV+W
	 Mkhu7jYEAXKJ1jRG5xqRur6EpFCt+ugPjtVsCE3BOsuKgglOdOrcZwJpNzjmNxa6UT
	 bfZ+1lKO2H+JA+sQJJG7Wl/PBhYmoAXqnfUh7mH3/dnQ6oqK8J2Btnwoc3gVO1El+C
	 /keEp2AcAZTa6AinGiweR+Dc6hX1maKvscK9nl2GolTZI4w+ybNzA4vbF/5Vb0oA0a
	 OrXVKvI9dafmHTw4WBEi7Zkl4TfykIjBJ24IRHEjZfvg+S5xDuHTslMQXkC0rMMmKV
	 /9b/IY3S1qSKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] kbuild: Mark usr_gen_init_cpio as
 no-dot-config-target
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Luis Augenstein" <luis.augenstein@tngtech.com>, "Maximilian
 Huber" <maximilian.huber@tngtech.com>, "Mike Rapoport" <rppt@kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Willy Tarreau" <w@1wt.eu>, "Alexander
 Graf" <graf@amazon.com>, "Nicolas Schier" <nsc@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, "Askar
 Safin" <safinaskar@gmail.com>
In-Reply-To: <20260928-move-gen_init_cpio-to-scripts-v4-1-f437a33c40ac@kernel.org>
References: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
 <20260928-move-gen_init_cpio-to-scripts-v4-1-f437a33c40ac@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 17:33:13 +0000
Message-Id: <20260928173314.338DB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

> Let usr/gen_init_cpio be built also if there is no kernel configuration.
>=20
> Askar Safin reported that gen_init_cpio may be of use before any kernel
> configuration is available.  Add usr_gen_init_cpio to list of targets
> that do not require a .config file.
>=20
> Reported-by: Askar Safin <safinaskar@gmail.com>
> Closes: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gm=
ail.com
> Fixes: f8e05c10631e ("kbuild: Add top-level target for building gen_init_=
cpio")
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-move-gen_i=
nit_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org?part=3D1

