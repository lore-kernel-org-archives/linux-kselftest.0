Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A71306B3D;
	Mon, 10 Aug 2026 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786396573; cv=none; b=N7zqmdj41U5vmkFEVlR+Rg8SjJurFSJ5cy8urJ5VVlHPf4+gp1TnKy9yQAvIKKVDRXD16e5xs1mJI3v6lzA/ZKTc/UCnb7Fi9V/t7UD7JsEbtwEWhHcBW0zjik4v4bMEA4d7YMV1pyrbu1gIOGnrRSWBvUTwE4G+we0cXMn3AgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786396573; c=relaxed/simple;
	bh=5A33E8bkCyr6TVLIf1qz+v4w2q0tLJXoUd6mQSS8ER8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5E4LLvIiuZoda4nyghJRSgDkPE1axs0nRA0w44xlLGYm4PtysKWNpXJYQlNzzKmbzCoMUPjAO2UPGSJ/uyFdTH7lRYu7CZSzFtxrucxquTaLlOBiw4A2LA34kUoI8nleG1EDty7YZ6KQPqvtpNqJUzNiBnVHjRZcq/+pnKP6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgUVoTgJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgUVoTgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C491F000E9;
	Mon, 10 Aug 2026 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786396572;
	bh=QWIK+lMPVrhXut00tkjRsnIXSSKPgpHCrpsvbxPTqS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cgUVoTgJBYJVJ24X2UWLImEObbyS5mIgkPuJmCuJKKL3XfVRdCkee0OWrZ0Itw1Bo
	 847/X3QyHWykdmQMv0ZTzrgZI5iQuxs2kDSy90RS1wW0TXhaUeoL5KekRZeewWQ9R0
	 1MspmkInHDaWkukW+XggG0P/fsg/N2upV8gRpkD2TIcFrbeQrKOv7OSihynWTHcyB4
	 6hyCgS/kO8TWtXfkYF1T0y/gtyEUzajfxcR7Ava45GFzFEu2BwTaMe/jkfPNlg1Cpo
	 3Dle6I8xWo6tJ01+M7aSbOVkc5hgmMwwFhywdVTqkoTJCETDz2wtmKeBqFsFIQTXEl
	 DMJVChPloJfxg==
Date: Mon, 10 Aug 2026 14:16:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 horms@kernel.org, i.maximets@ovn.org, i.maximets@redhat.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next v9] selftests/net/openvswitch: add SCTP flow
 key support and test
Message-ID: <20260810141611.598bb373@kernel.org>
In-Reply-To: <20260805034459.1460015-1-houminxi@gmail.com>
References: <20260805034459.1460015-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Aug 2026 23:44:59 -0400 Minxi Hou wrote:
> One listener serves the whole test. socat's fork option handles each
> association in a child, so the flow rules are the only thing that
> changes between the three phases and the listener is never restarted
> underneath them.
> 
> A forking daemon outlives the pid ovs_netns_spawn_daemon captures,
> because the child handling an association is not signalled when only
> that pid is killed. Start spawned daemons in their own session so
> each leads its own process group, and signal the group on cleanup.
> setsid ships in util-linux-core; selftests/vsock/vmtest.sh already
> calls it unconditionally in this same tree, so this isn't a new class
> of dependency for a kselftest shell script.

Did someone request this? It seems like an overkill just to make sure
socat has exited, no? There's plenty of socat *,fork use in selftests
without setsid. Maybe just set -T/-t to make sure the children exit
in reasonable time?

> +	# Probe: check if kernel supports sctp flow key.
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
> +	    '2' &>/dev/null
> +	if [ $? -ne 0 ]; then

AI says this is pointless, SCTP support is always built into ovs.
Please drop unless some human explicitly asked for this.

> +		info "no support for sctp key - skipping"
> +		ovs_exit_sig
> +		return $ksft_skip
> +	fi
-- 
pw-bot: cr
