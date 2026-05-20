Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF81799F;
	Wed, 20 May 2026 00:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235878; cv=none; b=TFb2gcN2NcxDfs1THlC3WP+xlZLRmceGqsIhwX6p02dv2/43ATRDgS1m22USHOLK7WtZMCttwGWMiy1rDO8HnhaX6bagcWRRaqBHQV4pIYMvMNwf7hwGqujJ54ioeAQjkLkYMg6ag7nTN6X0y87YSctdC9vP0tvTsqm9qoN7Uyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235878; c=relaxed/simple;
	bh=0yllbxrTlrh80TDt+gArw2uBnfAS5bYiWbbBfmVWJqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwIiySSoI9DlDQW6DAmK1Uci7XH2j/mzo3IDyGwfER3ouyeKDfPEXQkAy6jKrNc8hJxXM17Z2DwFJUHjBEbk8Umqe73JVYlYe1qidO3edF+/4chVi8De/o4l25YzaYgvKVlSe6BG6QME7pxqqjg6yu2LsKCbrS7TTOrRbjLVfz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1GoE4PQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1GoE4PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08C91F000E9;
	Wed, 20 May 2026 00:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779235877;
	bh=6uQf65YPF0MhdxqyCDs+R/XpQCKP8zOjKHxPY/KRBJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=R1GoE4PQdboMv+8Hx5gi9tUQ2rh95YkK//jTZ9b8ltIOssjJCdUmOZ/PPBR7MnHPe
	 1Evd7kWXbzLgxu9do2arnnawhg1O7U41fiAR/W2gpEIiD9APj3bx6l4t74RZyby/Zv
	 dGW/9XUHrWWwG/OyhCPiQRRgTIv5yWP6FZZp1oZ117a1Gm2/T1Z3uMSzf4saakWUIC
	 neVvFdtaRLORaSOAlFXUSXS0CMI0uXgy20l6ybXdR8/ODoN4E9WSaIBqB7X0c2Bbw1
	 rrN8FEMnbueQeD2+G5Zg8z30N7BKBfrVo/JLArBRdD0ODQ1jbKJDCwg34WHQ8lMY/c
	 5cSX6SRDaEHEw==
Date: Tue, 19 May 2026 17:11:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Shuah
 Khan <shuah@kernel.org>, Adrian Moreno <amorenoz@redhat.com>, Jiri Benc
 <jbenc@redhat.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matteo Perin
 <matteo.perin@canonical.com>
Subject: Re: [PATCH net 4/5] tools: ynl: support listening on all nsids
Message-ID: <20260519171115.60aceb71@kernel.org>
In-Reply-To: <20260515201937.2813983-5-i.maximets@ovn.org>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
	<20260515201937.2813983-5-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 22:19:23 +0200 Ilya Maximets wrote:
> +    def ntf_listen_all_nsid(self):

doc-string needed

> +        self.sock.setsockopt(Netlink.SOL_NETLINK,
> +                             Netlink.NETLINK_LISTEN_ALL_NSID, 1)
> +
> +    @staticmethod
> +    def _decode_nsid(ancdata):
> +        for cmsg_level, cmsg_type, cmsg_data in ancdata:
> +            if (cmsg_level == Netlink.SOL_NETLINK and
> +                    cmsg_type == Netlink.NETLINK_LISTEN_ALL_NSID):
> +                nsid = struct.unpack('i', cmsg_data)[0]
> +                if nsid >= 0:
> +                    return nsid
> +                return None
> +        return None
> +
>      def set_recv_dbg(self, enabled):
>          self._recv_dbg = enabled
>  
> @@ -1235,7 +1251,7 @@ class YnlFamily(SpecFamily):
>                              f" when parsing '{attr_spec['name']}'")
>          return raw
>  
> -    def handle_ntf(self, decoded):
> +    def handle_ntf(self, decoded, nsid=None):
>          msg = {}
>          if self.include_raw:
>              msg['raw'] = decoded
> @@ -1246,15 +1262,20 @@ class YnlFamily(SpecFamily):
>  
>          msg['name'] = op['name']
>          msg['msg'] = attrs
> +        if nsid is not None:
> +            msg['nsid'] = nsid
>          self.async_msg_queue.put(msg)
>  
>      def check_ntf(self):
>          while True:
>              try:
> -                reply = self.sock.recv(self._recv_size, socket.MSG_DONTWAIT)
> +                reply, ancdata, _, _ = self.sock.recvmsg(self._recv_size,
> +                                                         4096,
> +                                                         socket.MSG_DONTWAIT)

please add a helper method (_recvmsg()?) that only takes flags
and doesn't return flags or addr since neither caller cares
