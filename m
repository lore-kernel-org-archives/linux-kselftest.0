Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1974368D75;
	Tue,  2 Jun 2026 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419732; cv=none; b=dgE4DtEvlso1kLBrdYwNtVjFbYDm+9g6xdjT2xBAEHEcWdoAX3ozIFlK2ZB8Y0Dt5Ov+bvF4OyCe8K20GnpJwtCpTtp7fL7e1pX6WIzTOU2lzXLaQL191ZBzseaaN8Xk5H527rD3AjrEp/ucIuzrK3pX96YvEG0K7IV0rTeemJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419732; c=relaxed/simple;
	bh=HH/z7canl2OU9BPNqf3qYc7C4WXPq1KzR3Vnn1FqPfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EgCypo0K5Mjj5MJMluGNI7gCbCkvqhEnyV7ZVQGEXBaDfk1dGDuqJr6uwaj+rr0DnhbJ0QH80homtRZf2OzSQ/fiD9wRku4lUiCH0wTZq1TXZ8f2zV2Vju9DgY8aGIshJBqMX8JVrczNfTSG17ElYY9KTTE1xxUlgzcKTLCOG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPdpn2Ug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPdpn2Ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188071F00898;
	Tue,  2 Jun 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419731;
	bh=ShcL7r50dfVkd1EvhBq+OIaa4ZXVW5H9HttcXDcV92M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gPdpn2UgiboYZax3m1sudcCd1Bz3IObeQJ8gFwBLw0ARzbS0bi9eNPJOjxEYtg/FT
	 +pTvMg2hqxgWZUEM0Kz7DhvMRGLQXfTXKJbKZJM0QAQRunrgiTYrUfOlMnOannZwSj
	 yIRSczh7SteOl8ldrFzPnskPV5NFZcUtQJO7jXtzVEo1jsPiLGcACshrJdZzoWTnbD
	 p9JiYBo3MYfttrr20G00bzhqRwVrvnCKqoT62F1/0NWk3rEdSWmae1ZNFTlZSP6jC+
	 X7PEVjIoDqoIoV2IDAoEZEeRvpjdav5LJjcOPT2SVuhTtmqN7xGDUBaAiPJ7N8ZoU/
	 3jIo1lx4Jxx3A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v5 04/13] liveupdate: register luo_ser as KHO subtree
In-Reply-To: <20260602031717.197696-5-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 2 Jun 2026 03:17:08 +0000")
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
	<20260602031717.197696-5-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 19:02:07 +0200
Message-ID: <2vxzzf1cdgfk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 02 2026, Pasha Tatashin wrote:

> Entirely remove the LUO FDT wrapper since the FDT only carries the
> compatible string and the pointer to the centralized struct luo_ser.
> Instead, register the struct luo_ser via the KHO raw subtree
> API, placing the compatibility string inside the structure itself.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
