Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABE3C4562;
	Tue,  2 Jun 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388038; cv=none; b=UwWhuCPEvIEfPWO+aBOtNkDdarhYjbrtEbqzhQNWFxsclSpubH0Vz6xqyESDoPdrz1Dy9/vBi57/i/PcLbZgW86HGvU86vyf/qRSMhEe2YRV3UEpgbrqvwMAwFvYUUd3Kwmj+XWjhXB84kEI299s6Po7QetmKQEeaNCgumnT1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388038; c=relaxed/simple;
	bh=hVD6yHu5RHVokA9E0C7LCW788/Fb7bGWeYd5VMtyi94=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DG8sn5eisW3plx7yMDht5c61eboJt7eksQlAxRfI2canIb+X1hVO2CzSJo8nMAZ5BIRTpif14iGj+Q37MpbpdW3Sbt0LHrQG6+Ma76JfppF0KoGFfS/cb6TmUjYeH/Gc5XyzzOqXId3/qj/rLXmrPH1Xk+Evu+Pw/23uxmW9ejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiiL4MDo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiiL4MDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7D81F00898;
	Tue,  2 Jun 2026 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388037;
	bh=z1/GsCfRVNHOJEA6izSI1fELICv3oclmjsMXfZuvbdI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HiiL4MDooxKbk4zL5IfetQScDfo9p+gaoxWVoalB3YTSTvLSYN7i626/UbbekXXz+
	 t0CPy29ulPj5SHa9SSWcoHy3KRVHek7ttrSGlVQhbSDZsfpnvfYdZGNHqJmyPYmFuv
	 EjbtgI+Lt6k40LdPaxhhru9eNB39BwwsNGt6uWEQ/6p6HeS67ap5fUoPMMqbn+G4/0
	 gnNXw8m+1fKE9Y+4FPP5wS7Z4owmJf0rg3tO3/8Snd/vs3ahJDsCwmLPFAB+95nsGm
	 CVRVXZxC0SybfZCW6X4YUbOeGhse+KV5Ms7rm+TICefsrH9iXdF0p6Rk9Jqj6c0yPW
	 Tt2SjBEuPJbZQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 08/13] liveupdate: defer session block allocation
 and PA setting
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260530221938.115978-9-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-9-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 11:13:34 +0300
Message-Id: <178038801492.119771.3419366349068848854.b4-review@b4>
X-Mailer: b4 0.15.2

On Sat, 30 May 2026 22:19:33 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Currently, luo_session_setup_outgoing() allocates the session block and

"liveupdate: defer session block allocation and PA setting"

PA as "Public Assistance"? ;-)

Let's spell it out.

-- 
Sincerely yours,
Mike.

