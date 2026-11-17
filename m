Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929738;
	b=kPck1Yq/94i8JhEWOuA9rZOs5P4gXyfZaAfaWDOR3Uaxw2t6WoXTpLLaQM2+RV97glxn
	 jGoEhwvIYhpCE1aDWBoKp2nIPg6wsSiEqRgkaEGhRZqTXOJv1HaHhUdif4i361r9fxLCr
	 aPdNSUpOezqSupY7X0jm6DJIh1aRdJlac+nluTr7RzPFk0Q7UWuE3XNpVa2zUP4K6kyiS
	 E2J8cQ8mKTZmXmwmqsO0utqcMj9+7+A2L6jF8Pt4lO80p9OhZefJ9nyaQ6BbWGIeP2kCW
	 ciaMWaKU4Goa4+isjmgmPCDzkV81mYexdnNiszHsTP3Gw6BPO9yaGUmv5l4yPBcrYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929738;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=ELJIm6lhttTjycsb10kvfPy2zAiQZ1koJX28BayYPoo=;
	b=pRMhW2B3ahHN201pENGlMBfuAZ3X0hop6SkgRAQeR/IJ4Hma3iyfVT8rPbhk7Fk5VKQo
	 bV0BKjueF/ec5ZrwLRGBNnIeRrXMyktSkhuNZTCciLl5dp6cZpEU3bQJapyo3XsmQHxbl
	 4MlkKn1Ayrm280bCn9sTN7q+OlZts7N8kX1FB2Hjt2QRQYLoDgmuG4krP58NBbyCP4Oxp
	 WusoioIqfppkl4xhVqMWlCJg/r2ibCQB6KFAH3+FU63H5Y338IyPXL5UX5yP27TsGaUJd
	 jq8R3bF6as212kwkyb5daENKk2BDLIBPueOGHLIOlg6mPic2uzw7DKaeII4bsC0L4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gjy216fU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33884606A31C;
	Tue, 17 Nov 2026 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gjy216fU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DC71F000C4;
	Tue, 17 Nov 2026 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929738;
	bh=ELJIm6lhttTjycsb10kvfPy2zAiQZ1koJX28BayYPoo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Gjy216fUZNGD3yQdI+Uehx/94ckIhB71hpnfAE/TwX77hKNYh7ZxHFGnWd/CpdRTE
	 +NBD/byRDYwL961hDWv4FBOGSkhBYakuv9Yw5LKP+wS5BHkOAVfWkQMVv6oHF1p34v
	 5ixOOVMz/QSBpbUMp4yMQxTsAcLQVkxQ3Dq02JmVAdo/VMuWdy2y2O6/OT1Ij6dccP
	 1ldK9PhCVJkUIRU3Gd4FvTcgyqX+ACy05ea555OpIyF4USEQn17AneqZL4NoLnObqG
	 6DZ+IEHCw6JYk7NDqQkoJKxkMrV9HZSPljz7LTWG5Dm5qWA3MuNc12/o0HgInhkf3Y
	 i5UwP28sulVEw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Mike Rapoport
 <rppt@kernel.org>,  Alexander Graf <graf@amazon.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,  Randy Dunlap
 <rdunlap@infradead.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Tarun Sahu <tarunsahu@google.com>,  David Matlack <dmatlack@google.com>,
  Samiullah Khawaja <skhawaja@google.com>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KHO map
In-Reply-To: <2vxzwlqbfxtf.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	17 Nov 2026 13:26:52 +0100")
References: <20261116134013.1636689-1-pratyush@kernel.org>
	<179486913878.127049.11178890384802388709.b4-review@b4>
	<2vxzwlqbfxtf.fsf@kernel.org>
Date: Tue, 17 Nov 2026 16:35:33 +0100
Message-ID: <2vxzpkw3fp2y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 17 2026, Pratyush Yadav wrote:

> On Mon, Nov 16 2026, Pasha Tatashin wrote:
[...]
>> Instead of caller-chosen depth, the tree should grow (and shrink?)
>> dynamically bottom-up based on the widest key.
>>
>> Plus, with bit 0 tagging leaf values, 2M entries can be stored directly 
>> at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space 
>> is much smaller than 64 bits, so in practice the tree stays tiny in 
>> depth.
>
> I think it is a good idea to allow dynamic depth in the ABI, but I am
> not sure if we should deal with the automatic resizing just yet. How
> about we start with making callers specify the depth (max index/pgoff)
> up-front for now? The ABI stays the same, so we can add support for
> dynamic resizing later if needed.
>
> The reason for this is to keep things simpler to begin with. That said,
> I don't have a _strong_ opinion about this, so if you insist, I can add
> dynamic resizing from the get go.

I take this back. I went and looked at how xarray does it, and it is
pretty elegant. I thought some sort of rebalancing would be needed, but
all that is needed is to add a level above the root tree, and demote it
to a subtree. Similarly, for pruning, the subtree at index 0 can be
promoted if all other slots of the root are free.

So I'll add dynamic sizing and reparenting logic in v2.

-- 
Regards,
Pratyush Yadav
