Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610215;
	b=P6d/DgLaml6sRcvYLd+WrFFl2A4bNvjBgmBRPfggiOJx8X8S5/SzIjm9scm4RvSnKG+/
	 VxovMPxkwKjRJOcmPd6FCELaimYx2xokqpDlzWREApJruYdj8Mo62+D0jw5C6KkFAUyrw
	 Q8bQVqjnLpKYuaIJiU/5k+4hFh4K7nF2wHQBkcBdCaxKAMAT8qhnKKyedFIw/wU/S2Jo6
	 N2wCQ8S12IMfXsuEchu/6+OAruvr0YCVMTsEtVoReM1+aZeqD9Gqp2ZK6IQlYJgQFwoo/
	 YNPjzQ4e44NMEmMiotDepeb16RT2YeJ8JZwEe2HPGtE6ktqtVcG0dEIu9kt4r9Eiyhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610215;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+5FMk/SdVDW2nWnHSrzI8xlrVGDF8ncp2jQw4zwEyc4=;
	b=kVLcgslfg7QC/eYolrBgzStiTVXLXGdNRD0V6HZFKWeeCwM5NO1oMVicuAh9yP2Qkz+S
	 TDyf73ZmdDpeScM2m9jKFTq1WBJ40k/aau5g+ss0/LqiOwJsQL4/VZ0BWfM1UTtbEZQRx
	 NXJ+EFlAqbiVRgcChqXEpC4i31OH1HBLA7bdJJKaZ3ufBtLltU9eygAqfH49wAJqgneyj
	 reWfpICyjHnmZwhhZ7+rGdakMUzNn/+xzFMRpz5a+1YmjKwyMz0nTt3yQAIYkUVDWe2iK
	 Wj3tEA+93dY67wjs2Z72rf3CHGdTM06MpLNZhtOSpiVcPcCqb0vRfAOR47Ec35TPMMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i6Da6/9Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE3606A326;
	Wed, 25 Nov 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6Da6/9Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99B41F000C6;
	Wed, 25 Nov 2026 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610214;
	bh=+5FMk/SdVDW2nWnHSrzI8xlrVGDF8ncp2jQw4zwEyc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6Da6/9QG7+xJWge26mZa/kI07vKMbeFJy2lpzK9lsHG7NgXwVVYT6bDTM0Y7X6jM
	 /ElsQU1AntNDnyvsWBvehY6flvGiVIlzrdFXTQ1iin6ZACrjCQLIXRef2I64SUSx8h
	 OCRL+0UeK2Zl4Ck/L9NiDwXwbAu1EixBUZgdtAIuULrwGNPlclljAO/vIo3gdWwHLf
	 sIn03irdGIjzeiTK5l5vHdiNPPhOIzuoCIbiW9WYYC9Jy09oe9IbVFvmY8vncS8KlZ
	 ViQAykr5gO4VN1dKPrEUGo3dkg0+9c5Pvak0nCevMCinxzGun14x1KHNfUwpJLEmC9
	 sMcuy56rE//zw==
Date: Wed, 25 Nov 2026 12:36:49 +0000
From: Simon Horman <horms@kernel.org>
To: Felipe Pereira Stival <v0idpwn@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: tls: add a poll test for a queued
 KeyUpdate
Message-ID: <20261125123649.GW31322@horms.kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>
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
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>

On Wed, Nov 18, 2026 at 05:35:49PM -0300, Felipe Pereira Stival wrote:
> Check that poll() reports a read event when a recv() for data has
> decrypted and queued a KeyUpdate. Once the KeyUpdate has been read,
> check that poll() doesn't report a record sent with the new key.
> 
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

