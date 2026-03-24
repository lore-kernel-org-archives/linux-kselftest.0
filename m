Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD17373BF8;
	Tue, 24 Mar 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370835; cv=none; b=snckoV1cHmLO9gxEH+Al6EY3W6ao5RVdc+v2s7+WIf9LEB9epf2xb11qMpNyE5w5wqgJDwtF4RwdH5zCiPLj8fAL+IKi417PdJXo2YniFFAmftG4UWhvponOaqCkYqE2W+A07NFMfzdk9Kuz7T05eUk1/EfTsiBh+67YMirKKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370835; c=relaxed/simple;
	bh=4ViUw8TCDz0I3Y1T1Rr3HPHT6vOeEUMlcv03VxqWkF4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=EaWTX+EwBOxqCdp2pdWgccFya43BVAYJL4cuetteKGe/YL7nUcDqEcalGdOqXz/O8UQ1GU/Kxyr8uINwZvgbNKynrH2mXkmZv28DjSL81dXQVf97mw2VRuI1kfO2oITUtMYp0yHC/pqxdsKxAm7QF43/cRTBkuZhgPuKLOOFbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=dwGFGgex; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="dwGFGgex"
Received: from smtpclient.apple ([192.19.161.250])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62OGEjjw850550
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Mar 2026 09:14:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62OGEjjw850550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774368886;
	bh=4ViUw8TCDz0I3Y1T1Rr3HPHT6vOeEUMlcv03VxqWkF4=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=dwGFGgex1uGn0I6g8QIZcawnDS5wGEeGLeTM2zsm174U00BXlQ01uUJnZHf+N/3OA
	 KhcGCigTkd/e4Pr4XoZ5XaJypd1Izoh7ZdiNfrmlAhZOtpK/8mWwLcBEcwA0Env/2n
	 m0UKeK/em+zpm8YZyMdgHVXBjAiNOFGmy6x++sLC4SUQp4YMLRLar1/JTJPEPc/XyE
	 IZybPsBsQb+l1iZpnmDqtX12q+xgsLiVwwAy8KgCrulATCytW26spAtfeRQtFrPRLx
	 3IhoqfJ0W2rHLKpl6wPYB1HSh4vM8RGKNC6b6xKD0AMiPcXBgOuIQev4UuUiv9VszS
	 avy1BNbe8c3bA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Xin Li <xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Date: Tue, 24 Mar 2026 09:14:19 -0700
Message-Id: <911DB9B1-921E-4871-A9DD-BEC85F4B8320@zytor.com>
References: <20260324085102.688490-1-yi1.lai@intel.com>
Cc: Gleixner Thomas <tglx@kernel.org>, Molnar Ingo <mingo@redhat.com>,
        Petkov Borislav <bp@alien8.de>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        Cooper Andrew <andrew.cooper3@citrix.com>, x86@kernel.org,
        hpa@zytor.com, Khan Shuah <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        yi1.lai@linux.intel.com, yi1.lai@intel.com
In-Reply-To: <20260324085102.688490-1-yi1.lai@intel.com>
To: Lai Yi <yi1.lai@intel.com>
X-Mailer: iPhone Mail (23D8133)



> On Mar 24, 2026, at 2:04=E2=80=AFAM, Yi Lai <yi1.lai@intel.com> wrote:
>=20
> +static bool is_fred_enabled(void)

Move it to a public header? we may use it in other tests.=

