Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B38444C648;
	Mon, 21 Sep 2026 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977420; cv=none; b=UHdk4tfC2LTox+T4Xl+OhHpkXBDbXmUV0mDq3IBXjTmnBxmeMGEQVznoWUM4Nujqg4czivFEU4LPToFNl7MjwNGP0yqpgTrrwQEkc+wC/xcoFrYlcB1KMZUWeERmTJnR78+jdLVOy6cQRhwJBN30ZuQCQoyF78dlRq+zQd/YYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977420; c=relaxed/simple;
	bh=+HPwIhCiQbj0dKT5ajgWHxcYNc7fLjO50GeE6cFQ3Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geGmm/dnMCD1qalxfpnoi1sE+fcgw9HZyoghn072ZZZZL3453crEmNFynwh0USSAdq/HiaeqNw8rYMuZSTWnzP3tsEpC+IwVDjigLmaWyI0BEeR2ib/9RQ/VsW7tI4NjddC46c4ohRVNQhBaz7Ex2qu6GyWfI426EG4QTDTVIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5BB1D1EAC3D; Mon, 21 Sep 2026 15:56:56 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 1B67F1EAC30;
	Mon, 21 Sep 2026 15:56:54 +0800 (AWST)
Message-ID: <daa639e5-a5d8-47c5-9739-69d721052366@davidgow.net>
Date: Mon, 21 Sep 2026 15:56:51 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit tests
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260917064736.77354-1-kmehltretter@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/09/2026 à 14:47, Karl Mehltretter a écrit :
> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
> with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
> configurations. The debugfs suite is present only with DEBUG_FS=y and
> all four cases pass.
> 

Acked-by: David Gow <david@davidgow.net>

Cheers,
-- David


