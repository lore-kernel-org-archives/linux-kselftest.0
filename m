Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCB2931D5;
	Thu, 17 Sep 2026 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610049; cv=none; b=oLb7enX+jvbJgZ+UsCqCrZuPJ/NMZpb122Os3LEhJbdjAVbKu09bSHN4GEzbWJDA/AptPVu5zW5Gii5aOG87VUm2WH3UO4/vm9kvCQSf7T/He/O9s4KJDzDcdkyU3BAqWhcuOBQLtIgIMD0OfMEKtRS3rUrezuEJcVDFYCLNr88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610049; c=relaxed/simple;
	bh=dCBNkgH0hkvfOkKcTvYLGNdkN7fzD2uXSOMAehd0UMc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6H0Pa576FUk109Obl8/rIf4kEfpWXLnm+R5W7h+MrdAJ1xHDm58HLzbZ5emuklvAUCJdGD4YI4UB039YPQplK5WJfAL/SycsvQPk316N42pgzT9nXdAMZPLt9KDDYYFKUutFFHajkOsDfrbvwKy7M9K/dG/yaNKNE1NY0ORc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYdQMABl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYdQMABl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FCE1F000FF;
	Thu, 17 Sep 2026 01:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789610047;
	bh=lJgZZsakuZqXW/oddZR8VQa35CTe8PRxmIQUO7sOKWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cYdQMABloJWtbJ2B/fSHJAPMA8LJWkpn6fZqRjEpGXoTe+o6RyveYUUoFOwWZ2BPZ
	 cr2iPbwxEBG58wE3ostpVUM6h+HrV3A6gaOFmKxz6JDe/CXEtN539ydQVa08kGCzMu
	 58vPJpublJaKsVybjqyizLxgp7V0HAEMRhrLA1txpHaBvD+1QR6QXVxKzjA+kgdtjX
	 +wVft6iQsiBeZxqhS3wCjndGIoVX5FaCcQKhiP9VJe/VjF6VECLaFV+6KUx0j+OWOR
	 F7IRsT2nis4e4JkQXhsooy3AxYUDcNk8gyTpbDv/2kb7GVBELYs4zoKIQ54rh86DOS
	 AX4u3ut4VtyBA==
Date: Wed, 16 Sep 2026 18:54:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon
 Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET
 multicast dumps
Message-ID: <20260916185405.2ccc6aa3@kernel.org>
In-Reply-To: <20260914014539.5015-5-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
	<20260914014539.5015-5-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 10:45:39 +0900 Yuyang Huang wrote:
> +        try:
> +            addresses = rtnl.getmulticast(
> +                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
> +                dump=True)
> +        except NlError as e:
> +            if e.error == errno.EOPNOTSUPP:
> +                raise KsftSkipEx(
> +                    "kernel does not support AF_PACKET multicast dump")

What's the point of catching this exception?
The error for ENOPNOTSUPP will be both very rare (not sure I understand
where you expect it to come from TBH), and also about as meaningful as 
the skip. Just let the exception propagate, it's fine.

Otherwise Pylint complains:
W0707: Consider explicitly re-raising using 'raise KsftSkipEx('kernel does not support AF_PACKET multicast dump') from e' (raise-missing-from)


> +            raise
