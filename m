Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607637B3F4;
	Mon,  4 May 2026 23:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937958; cv=none; b=JbhpEIj3IDIqYZgBUIdQzeZMqb1MTrMD6Ls2+M81C8tNtil5XbSkoMsssk/HNxDASR/CwHGxo7gRzNriPX4DyrnhrGT8rFZ5m9ztoXgGchJBhtXM1lfT+GGO5H7QKAT32QfLUSAnB7C0LNh8qPShxu7V9NlAA8amj+gLnx6WdPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937958; c=relaxed/simple;
	bh=rGhCAgv7V+Aw2yNHCHAsZ1MiCQDgCZexQb57zy/+Wto=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAWDcxgZZ93FTo6W0quzqab5GSiVK5Cy5yRnLL3p6XVPvWOFetV2j8vXcE9ij31SD5uwNo5CRy/zLVEUpuhIJoGAmOMGuiKa0Yw6h6Z/JjkC/ziaOaUBYyCAohJixbD70dQs+Yd4zs+ZbYHIman3TpnRFqnTlEPAzZ6nGISWSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeYaQTwk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QeYaQTwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8F2C2BCB8;
	Mon,  4 May 2026 23:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777937957;
	bh=rGhCAgv7V+Aw2yNHCHAsZ1MiCQDgCZexQb57zy/+Wto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QeYaQTwkspFYexYjdtm/g3tch402fhCdjjnsFH6OilZB5yCV70ZaSP8BB//uJ5JmK
	 GPS5Y43vKC0N4eq8VZF0iVK0vuhuUHM8Br6tXoH6Q2hfMrUpEifVYsrdPFBp+tM9lD
	 lu8JjaaUsLBYbraoVxS6uBBHDqXdBUAq5a0eJ74uvbHmIRLiCVt8hLOkKqcIS4PP/g
	 icqRIgxccUqUuJjvVHD1tC3V0upu+Hpzpl25L6qqZepj6Ge+/ossmPKvSAAweT8ySw
	 dik1KUi9zIBN3OqALQ4RqfTCeCkMIfcrqKafHAW1lhym5WJPc0yOsBdEp6honMUc7w
	 nR8Adg+AamVwA==
Date: Mon, 4 May 2026 16:39:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan
 <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433)
 behaviors
Message-ID: <20260504163915.4a8b028e@kernel.org>
In-Reply-To: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 05 May 2026 01:30:10 +0900 Yuya Kusakabe wrote:
> This series adds the in-kernel data path for the SRv6 Mobile User
> Plane (MUP) architecture defined in RFC 9433.  SRv6 MUP integrates
> GTP-U mobile traffic into an SRv6 transport domain by mapping the
> 5-tuple (TEID, QFI, R, U, PDU Session ID) into a single SID, allowing
> operators to replace the GTP-U overlay between the gNB and the
> upstream UPF with native SRv6 forwarding while keeping the radio side
> unchanged.

Could you switch to posting this as an RFC until you gather some review
tags? Our CI require manual intervention to add the necessary iproute2
patches, I suspect there may be some uAPI changes therefore requiring
iproute2 changes here.
