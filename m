Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51673260565;
	Fri, 25 Sep 2026 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364841; cv=none; b=FxnLZXKh0MlXgBmScCiVe3nrwmKZa/Hod/yISrnqkLdDDbWQf7ActBey3uIVNZtZHBvtaEWQbTP5v4gUPNvE/MI16e9WiIjY3Ll3ayuvWg4yrnuLynDn4gfi1yMoPyWJyGlc8UmiadLHSuWeyH6hLU+8XEd1hX5gMAKmFM0VKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364841; c=relaxed/simple;
	bh=6Iuo+I2nD6yncNe82NwjIWKe6yVkysivA0nQlXA/g7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YYQ10tHIaeem/+ilUKp6tmPlIU2x7yAdtAWo6VgFYtlicAmGitXsShDfVEOtaMnUwAfM5fDKanCVk3Zcd8mROQcxK3ujSJDZwznKKMVXen6kfKuRJ39wtrv0kdUd+h1DyXIo7ZHcdbBnHpZicc8nbIShGCbNkdAbd4sYIuV3zPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJcTgrQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJcTgrQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC591F000FF;
	Fri, 25 Sep 2026 19:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790364840;
	bh=vhgSzrfp/pMMNZb9pxFnuj0VXMHs0TjA//aVTOauAkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJcTgrQy4zKteYhB+2eS4JxXxiByQG6+6Ay4P6egHkQiQIBuIBS7gzHlibknm5l97
	 hitC6GxzFuFpPe2DEbiiVpjy+vYvgrlX4yFojtBwMzywJ46zwuTWUs9NkBpvHAuNNG
	 zOBL/sF8klXo7k/0X4MQjKpt4NiOYYxmjcX0/6aaOkqCkEOYsi2IRx+rQo9VK+T7cn
	 fWo0ngx0AcN4K2VWv306HPC7mb0iP2A+4PSBs3HMU3MhUuF0zZMtunnJge1c0SS3wg
	 K85c9Spcycj2xoEI70kiMhp7vQPBVpz2nrxFX8NOXE961jb2Q83OxfxggLQfV6ZUxw
	 FmKd2NlR1y5vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] kbuild: Mark usr_gen_init_cpio as
 no-dot-config-target
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Nathan Chancellor" <nathan@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Maximilian
 Huber" <maximilian.huber@tngtech.com>, "Nicolas Schier" <nsc@kernel.org>, "Luis
 Augenstein" <luis.augenstein@tngtech.com>, "Jonathan Corbet" <corbet@lwn.net>, "Alexander
 Graf" <graf@amazon.com>, "Mike Rapoport" <rppt@kernel.org>,
 =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Willy Tarreau" <w@1wt.eu>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, "Askar
 Safin" <safinaskar@gmail.com>
In-Reply-To: <20260925-move-gen_init_cpio-to-scripts-v3-1-99c493f76722@kernel.org>
References: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
 <20260925-move-gen_init_cpio-to-scripts-v3-1-99c493f76722@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 19:33:58 +0000
Message-Id: <20260925193359.3EC591F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-move-gen_i=
nit_cpio-to-scripts-v3-1-99c493f76722@kernel.org?part=3D1

