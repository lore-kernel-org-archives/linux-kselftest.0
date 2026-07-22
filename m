Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFA3242B2;
	Wed, 22 Jul 2026 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731421; cv=none; b=QEeWrZT3lOK6aeJk0Z/HXwGvMxHMSyDAQrZ5BB5XLXd1zPXDaZNNz/i7Ocdg2ifsk2MlN7lm5n/DnNMUc35DtKhceAd3svEVkZuMF8jm939wNshwPy33g9ZfvSGA94ieCJ0UPK2TxmjcNKwXob1QDHJr331XLgTdMq1IV5cDauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731421; c=relaxed/simple;
	bh=GFdrFD4PStNyo8uAu2Wj4B/nbzfW1ZIci9R53SmzFJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgc3JmeBxmLX/NJIA+OERFjIr43FpM+hIPHEKE4c1Hdx+qzxcxvJuliTIx9T4buKKCaB46SP2veIIFra6lJk/AvRtDDV1Ge3MiASph5LMBn90wvnXrc91YLAXNJXvJF+UsQQDkKSD1d4eQHAV8BbR/5R3VqbvsJPprgg3nW1MvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuWPqmTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuWPqmTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3211F000E9;
	Wed, 22 Jul 2026 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784731419;
	bh=engNj+jm1QpjkZvlpVGE+xstepiLeZSDmIAMzwxBlLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KuWPqmTQg5clB52adLRdE3DoINVhLOBPeEhSKJU5MP2o0hKUMLrt/mQ0WzOVcRtsE
	 HJqPacviYPU5idKt6MsbDB/TGbU5uyTooAEPlBbOw40WVK7TRK8ii94qpuI4eGCgEf
	 HQsiWX5N7igbo9fHMoYtYT1eWHElkI3uSF50/JZ0mElGUKIgiV7CtirAQ98+qsgq6F
	 aje1Xknh4iGEqPFALurWcd1VETBVZtN7jcUipyE+pmTo5ecmZrmLQtPNX+nQX8ZAOY
	 Eid3ZhZ916/5rU1JJ8v4/yC4MF7mKQBFfIGGz8+p+/FK+wthjWS5AAOzpZa4SCetVQ
	 phgLzh3+nid6Q==
Message-ID: <e48c03d5-8056-4b65-a651-5f57c1a4da9e@kernel.org>
Date: Wed, 22 Jul 2026 08:43:38 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Content-Language: en-US
To: Ido Schimmel <idosch@nvidia.com>, Jack Ma <jack4it@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
 <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com>
 <20260722114621.GA2928696@shredder>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260722114621.GA2928696@shredder>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 5:46 AM, Ido Schimmel wrote:
> On Tue, Jul 21, 2026 at 10:29:50PM +0000, Jack Ma wrote:
>> Commit 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries") lets a
>> single inner MAC be reached through a group of remote VTEPs, with the
>> kernel flow-hashing across the group members.  Each member carries its
>> own remote IP, but the UDP destination port is always taken from the
>> VXLAN device (vxlan->cfg.dst_port) and cannot be set per member.
>>
>> Some deployments pack several receivers behind one underlay IP and tell
>> them apart by UDP port, so they need a per-nexthop destination port to
>> spread flows across (IP, port) tuples rather than IP alone.
>>
>> Add a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT) that
>> carries an optional UDP destination port on an fdb nexthop.  It is only
>> accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
>> nh_info and echoed back on dump.  This patch is control-plane plumbing
>> only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
>> is unchanged for now.
> 
> I looked more closely at the test and the iproute2 patch and wanted to
> comment that "port" seems too generic given that the attribute is
> specific to FDB nexthops and called NHA_FDB_PORT. It made me think that
> maybe we should use a more generic attribute name (e.g., NHA_DST_PORT)
> and a corresponding "dst_port" keyword in iproute2. We can still limit
> this to FDB nexthops during validation, but in the unlikely case that we
> will need a destination port for other nexthops, we could just reuse
> this attribute. It's not like we have NHA_FDB_GATEWAY.
> 
> David, WDYT?

I was thinking along the same lines -- FDB_PORT can be confused with
bridge port. No preference on dst_port / DST_PORT versus other options
(NHA_FDB_UDP_PORT for example)

