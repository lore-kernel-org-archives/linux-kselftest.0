Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395349;
	b=oDGJXT7NTX7PqHnJk20J5hWo/kiwihAvu/Zla124NfwUXgUly4tVHKFOzGSCe6GDb8iu
	 3MKQ2HdESdBP+OlQQ6tibDE8HnnaQ3hBrkpaGnuv4UdZgt7yRjuJbuLGsAlxcgVKema8n
	 jPqMmO1Opw2shCT6IXMnA4s7/sJJI4O1X3IU+fjeohYJmhwXALKNM9yWO5oc0KDLMX3k+
	 I1vdIt10o7Y2uOnqSb4dJE1gE77Lwnfl7etXDx1xCKiVvPVmlkmNRzEoKOFiLANznNbyc
	 OJQ7NOCM3KbIZDiAHIhlo5NtMyMw79pf6TQMwiYf4AaAj45rUWwCS2SNVGIvrWu2ytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395349;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=1E8ZwW2Eu8WYRG4t6PuIDQjLMNRBTfUw3ilSDjs1rRU=;
	b=j8bKmkN1th4G6EdENL/W6SksPWkN68GpyV7gd3YgY5KoOrFFxRBewYMnHoz+6EnEBHYq
	 j24Waav80iL4EycnPqrjWGsSv4hR4RgrXKJyakGl+avupYsfqoriOAmw67CpcTZyOhQr5
	 djO6KZeZb8mwUv0t9Yk7mh2AKGvSYMP9a9YvTY3fu9ZII+wHav0PbVwyVj/gCfkBLx9AE
	 g5TlSzZbBDWSpNvW2ERyMGcqC4cNMGncfjcjk1DGMaMZfDeJgO2GPflY2Wh4Xfs8rtZN7
	 gOT3rkuTZXosMMkRDzXoE1W7DbF+UOaUz2aCAuJh/N/nVgvBiBtZIyY0n2bwq8mwhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=cmaAuP8N;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD11606A882;
	Wed, 11 Nov 2026 11:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD11606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=cmaAuP8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1E8ZwW2Eu8WYRG4t6PuIDQjLMNRBTfUw3ilSDjs1rRU=; b=cmaAuP8N+P52iDtJVOwMGPU1Rm
	FqzHy98fPelH0mq8DY0owqaAxg/oEFesnLx84zScoPFheV2k7WVlrIMZiD+YqhJOtdi1Uad5BMK9F
	6en5BPWw+v3fE+/rL0Y5CGl2nlw31TWn7YIv55D9SZjD1cX3jcE0XFY9dru8/P/fJ9kxPBYu19j9r
	dQCRq3bb5gxvXhKwVOCKpAVuCo/ZyutzCT/zkQXD2VE5qDpt5OROuRuNhBFVcpEfNi5ysabYpZyI6
	NrlmK+fONZ1CyH6Ge32APS7qP0t5pyBN5b2pWN8ZWGxHWvL80WG44ipLS8WqhJtviyLV0r98zCRA3
	+B8IoyiQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xR6CD-00D8c2-2m;
	Wed, 11 Nov 2026 11:08:54 +0000
Date: Wed, 11 Nov 2026 03:08:48 -0800
From: Breno Leitao <leitao@debian.org>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
Message-ID: <avRMoA8Hy3P6k72d@gmail.com>
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
X-Debian-User: leitao

On Tue, Nov 10, 2026 at 11:52:55PM -0800, Chris Down wrote:
> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.

Good catch.

> 
> Free it with kho_restore_free() once copying is complete.
> 
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
> Signed-off-by: Chris Down <chris@chrisdown.name>

Tested-by: Breno Leitao <leitao@debian.org>
