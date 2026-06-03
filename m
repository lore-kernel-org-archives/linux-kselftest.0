Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9B3168EF;
	Wed,  3 Jun 2026 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493528; cv=none; b=eGhTCfPyIVtEz9YSmM0ea4WZnnyuvefpiOfNMIwrcMg4brgBfyLPt3Fz6sFWF2hhawzpAgQbNaKayT4wswt512bjC9X66oSpOyjfUp/HQ8T/YEG6FIZMj/qoMhGZaU7KubajZuSn5PdEJsFVUVDLjNNhKUhjqraOQhqSS7XI0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493528; c=relaxed/simple;
	bh=1diPvZIpoxcfZqMiiJc7Z0e2KBakzwtM4BCrDTv7Go4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=R+WthYj/c0FTu7/ySe9a3FZxvOKIVCh+Wct64Qwh6pitpLEwzt1l4/EoTEP9eZU2BhdcCrEbzxyVlX89UbCp2zEXpf9zjqAFYagP1s2XtAnIPlLZ73Vbggc0T6M0gpzeBmEvXPyGJgt3NyIOLB3lkyzvxnsZF2WmhX/fmS+rt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JU2sXsiR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JU2sXsiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48181F00898;
	Wed,  3 Jun 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493527;
	bh=Cg+TcWYKH4zzSMQZZLp5kN+E2gVzcXQLNcYelVPRezE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JU2sXsiR/R+jB1usuGwYZ9BkGQPozH+ZvF/mkoXgnW9AWwiWthn17AkDWglmUgy6D
	 sKvP7SS3IghC9HxhVcaGk/dG9dfxglfPxiv48m5CkmN9l/WwewFQD2K0VNLdLuw4f/
	 cYLpukaqAyfBFTsUtgzZVJ9av54lTUEupI9P1/1oGScoc7gGnBOkHlyeYbeyPSFw6J
	 Xm/3tUTPs3oOsLRD0bZ0+4sycFGE98Ix2++7hnQRW5twZkUPI+weT3yZdEvmO4FgRS
	 gGo5UrJwPmDfNAmEYMzodASNKLFmXxOJSA5frYYJ3GeH7FlGD4G0XJCk0v1vF1Spyk
	 wQSkGFQnd0TKA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 04/13] liveupdate: register luo_ser as KHO subtree
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260603032905.344462-5-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-5-pasha.tatashin@soleen.com>
Date: Wed, 03 Jun 2026 16:31:59 +0300
Message-Id: <178049351951.475072.17505666427466268204.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 03 Jun 2026 03:28:55 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Entirely remove the LUO FDT wrapper since the FDT only carries the
> compatible string and the pointer to the centralized struct luo_ser.
> Instead, register the struct luo_ser via the KHO raw subtree
> API, placing the compatibility string inside the structure itself.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

