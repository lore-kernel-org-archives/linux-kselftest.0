Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA11345731
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775229964; cv=none; b=EOAcaXL7Sn4mIGnzpHhu3oCxhjLno74qLowDUWMeTeYQu8OQYEkYOoqBphPYp7i6c2rFUHXruFLeJwY5WDgNncfrRewbCpjvHcCTfCxPqJ05ZjQ8dP4CIQQkGdL6Mq0W/bIRs0KMxLeyP6pDIZi43fyU++Do9EXtlZfEEiKL7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775229964; c=relaxed/simple;
	bh=/iuUiBKd/QehSumXg68bTOYBxK/MWSEcoYlGJ5L4Wi4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=HHKgQopS4c4ipucdLIOq6/EG3V3RtRE2ksA7F+ClXAfbcS9WBlqkM09dYyDIDe4e2rliH/rnhd0zSLDbqVixVUmc8NZI1VwBQYKHi3yCEIIQrPywkOrDh8IZZwVvtxTB66IkpJOQkP05en9tvULhwlUh5X2n2bv/Ek6PO2E3tY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPnSFXxx; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPnSFXxx"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79853c0f5b9so33108037b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775229962; x=1775834762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phgEzarmetA3rPcVDi8C467Z7leoFPBcCeNvveOYnOE=;
        b=hPnSFXxx15dfsYGWgXmJoQPNdxqnS+jk29YdsNJwJJKvnpCuyaEZBSVqXi2yVOvr7l
         emsXExVs9Rysc4ukhZMufx5+2b5CGD5n5zJiwIyzNaDx3gCt4+TawoGbcKBeFpxlIpxP
         CcwFnyi+SPBH3DeVIsgBth9xu1U12YiZ/L+ZgXxYHAFHmv/SR/n4HtXnSUlYlT5wPh6E
         gppzDIigx1L4rRyjYfC2KsfTJlqUE2YfMcb9z7DBxB12EI1WnjnGZdspw1FeuA43a71G
         rNgcA7HQxKwgVCiDiNnmN1QvcljMY3bONR12k9aoh+/IVZVY+sGyy99tt4dh7Hm+bdFS
         +pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229962; x=1775834762;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phgEzarmetA3rPcVDi8C467Z7leoFPBcCeNvveOYnOE=;
        b=h+zz2B1Csv2oOqas4DFzqaurejir/wi2QuRXAJZKcKD2GmdD6tLz7ZAYwIpRT3calW
         ZET5LvNtFZrXf7yljXSE6niQ6uaf4m27xT8wVVhR8LPTYWjX7LZtKf/OfkVupllWlj7v
         ZhOpFLmIUgRP0NuAwldW9ndQ1ETUwLCb08pB7uyAC9lWiXWQFQpsywWNSRulrwGxvjqO
         cfxPWvCNvffXRZ1PvZ6MoAM3TYMyDdCa7U5YTZV/z9AlYSlehRWC9vnFVvPGBe6TtbPt
         et8Clw6aD/An7cxtr+olYzrlw9R2Q/GBw3+2LcQtZqWXpsZ77nZ3MRt8f41D77PGicSE
         DJxA==
X-Forwarded-Encrypted: i=1; AJvYcCWtSBSDciRalGn1auZH8Cc5a3k0PjYcthg76MvfLZmq2XGQqva8QnmqfcPpN+1bW0DNdyHOl8MQJOORokaw38s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ife+IjlJ88ZdpOg23VOfH7dt7YV0YI+ISQzTdpQcJxt25iPf
	CWAjSPFOuck3YzxQ5gTt34ATrZMZrA7JC12MDL/O+8drmVChCoGcQ7eC
X-Gm-Gg: AeBDietICgOiwUY1Vw+ONvOWCXEr80XB/Pe+ZyZLu/7z6XcZOA1Nj0/ItsYjlxXwVaA
	sGZm17OFI6k3v3k9h6sgbxahSN6rccnlFCO1cvHvoEn7/H+D8YlITbLYCUt/wjS4pEvMvGlCy/w
	dE94LaWtJxv8vBSCaqVZvc1ECjeBkNf3bq9lGv+PISAAyJP6Iy3pMZtrowJNKryAuAGxjezx1e5
	SWNJ4bVOb1ufYxuLuDHsrr2G0y5ObalK5MRjjSzq6Ap5rQMuZp+KN9UkDhtkUDZ+k3XWwIxeFtg
	K/8KHJjFMH594HNM0mQfhAArVsaitHZHj43ZnBqe0VK5IuagX67irJjaBA0IPhUgkahQ7swTkjt
	RreYXWLIYpv3/pvfLR4tUmUEGQIxm4wxQ10hPSXkOYXLo4AckwaBiWDHTnEsdrBf/OHESsKuyKt
	+huaMPqLnsbhLz9fDI79Q/m5FvTjW/Iu6nyWH4coHTmHexqvx567J94245CnHbQy2s2nS6CUVLT
	Mwk
X-Received: by 2002:a05:690c:d96:b0:79e:8d95:7ebb with SMTP id 00721157ae682-7a4d3ac7a7fmr35626207b3.14.1775229962152;
        Fri, 03 Apr 2026 08:26:02 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e229135sm22909397b3.3.2026.04.03.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:26:01 -0700 (PDT)
Date: Fri, 03 Apr 2026 11:26:01 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 linux-kernel@vger.kernel.org, 
 willemb@google.com, 
 Joe Damato <joe@dama.to>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.886450145305@gmail.com>
In-Reply-To: <20260402232203.2004496-3-joe@dama.to>
References: <20260402232203.2004496-1-joe@dama.to>
 <20260402232203.2004496-3-joe@dama.to>
Subject: Re: [net-next 2/3] selftests/net: Test PACKET_STATISTICS drops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Extend psock_snd to test drops by setting a tiny receive buffer and
> sending a large burst of packets.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> ---
>  tools/testing/selftests/net/psock_snd.c  | 52 ++++++++++++++++++++----
>  tools/testing/selftests/net/psock_snd.sh |  5 +++
>  2 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
> index 5be481a3d2bd..7bbce274b9f0 100644
> --- a/tools/testing/selftests/net/psock_snd.c
> +++ b/tools/testing/selftests/net/psock_snd.c
> @@ -39,6 +39,7 @@ static bool	cfg_use_gso;
>  static bool	cfg_use_qdisc_bypass;
>  static bool	cfg_use_vlan;
>  static bool	cfg_use_vnet;
> +static bool	cfg_drop;
>  
>  static char	*cfg_ifname = "lo";
>  static int	cfg_mtu	= 1500;
> @@ -49,6 +50,8 @@ static uint16_t	cfg_port = 8000;
>  /* test sending up to max mtu + 1 */
>  #define TEST_SZ	(sizeof(struct virtio_net_hdr) + ETH_HLEN + ETH_MAX_MTU + 1)
>  
> +#define BURST_CNT (1000)
> +
>  static char tbuf[TEST_SZ], rbuf[TEST_SZ];
>  
>  static unsigned long add_csum_hword(const uint16_t *start, int num_u16)
> @@ -212,13 +215,14 @@ static void do_send(int fd, char *buf, int len)
>  	if (ret != len)
>  		error(1, 0, "write: %u %u", ret, len);
>  
> -	fprintf(stderr, "tx: %u\n", ret);
> +	if (!cfg_drop)
> +		fprintf(stderr, "tx: %u\n", ret);
>  }
>  
> -static int do_tx(void)
> +static int do_tx(bool burst)
>  {
>  	const int one = 1;
> -	int fd, len;
> +	int i, fd, len;
>  
>  	fd = socket(PF_PACKET, cfg_use_dgram ? SOCK_DGRAM : SOCK_RAW, 0);
>  	if (fd == -1)
> @@ -242,6 +246,10 @@ static int do_tx(void)
>  
>  	do_send(fd, tbuf, len);
>  
> +	if (burst)
> +		for (i = 0; i < BURST_CNT; i++)
> +			do_send(fd, tbuf, len);
> +
>  	if (close(fd))
>  		error(1, errno, "close t");
>  
> @@ -290,6 +298,7 @@ static void do_rx(int fd, int expected_len, char *expected)
>  static int setup_sniffer(void)
>  {
>  	struct timeval tv = { .tv_usec = 100 * 1000 };
> +	const int one = 1;
>  	int fd;
>  
>  	fd = socket(PF_PACKET, SOCK_RAW, 0);
> @@ -299,6 +308,10 @@ static int setup_sniffer(void)
>  	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv)))
>  		error(1, errno, "setsockopt rcv timeout");
>  
> +	if (cfg_drop)
> +		if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &one, sizeof(one)))
> +			error(1, errno, "setsockopt SO_RCVBUF");
> +
>  	pair_udp_setfilter(fd);
>  	do_bind(fd);
>  
> @@ -309,7 +322,7 @@ static void parse_opts(int argc, char **argv)
>  {
>  	int c;
>  
> -	while ((c = getopt(argc, argv, "bcCdgl:qt:vV")) != -1) {
> +	while ((c = getopt(argc, argv, "bcCdDgl:qt:vV")) != -1) {
>  		switch (c) {
>  		case 'b':
>  			cfg_use_bind = true;
> @@ -323,6 +336,9 @@ static void parse_opts(int argc, char **argv)
>  		case 'd':
>  			cfg_use_dgram = true;
>  			break;
> +		case 'D':
> +			cfg_drop = true;
> +			break;
>  		case 'g':
>  			cfg_use_gso = true;
>  			break;
> @@ -367,11 +383,23 @@ static void check_packet_stats(int fd)
>  	if (getsockopt(fd, SOL_PACKET, PACKET_STATISTICS, &st, &len))
>  		error(1, errno, "getsockopt packet statistics");
>  
> -	if (st.tp_packets != 1)
> -		error(1, 0, "stats: tp_packets %u != 1", st.tp_packets);
> +	if (cfg_drop) {
> +		/* PACKET_STATISTICS reports all packets seen (including
> +		 * drops) in tp_packets
> +		 */
> +		if (st.tp_packets < st.tp_drops)
> +			error(1, 0, "stats: tp_packets %u < tp_drops %u",
> +			      st.tp_packets, st.tp_drops);
>  
> -	if (st.tp_drops != 0)
> -		error(1, 0, "stats: tp_drops %u != 0", st.tp_drops);
> +		if (st.tp_drops == 0)
> +			error(1, 0, "stats: expected drops but tp_drops == 0");
> +	} else {
> +		if (st.tp_packets != 1)
> +			error(1, 0, "stats: tp_packets %u != 1", st.tp_packets);
> +
> +		if (st.tp_drops != 0)
> +			error(1, 0, "stats: tp_drops %u != 0", st.tp_drops);
> +	}
>  
>  	/* verify clear on read */
>  	memset(&st, 0xff, sizeof(st));
> @@ -394,7 +422,12 @@ static void run_test(void)
>  	fdr = setup_rx();
>  	fds = setup_sniffer();
>  
> -	total_len = do_tx();
> +	total_len = do_tx(cfg_drop);

only if respinning: no need to pass global cfg_.. variables through
function arguments.

> +
> +	if (cfg_drop) {
> +		check_packet_stats(fds);
> +		goto out;
> +	}

can this not use the check_packet_stats added in the previous patch
right below?

>  
>  	/* BPF filter accepts only this length, vlan changes MAC */
>  	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
> @@ -405,6 +438,7 @@ static void run_test(void)
>  
>  	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
>  
> +out:
>  	if (close(fds))
>  		error(1, errno, "close s");
>  	if (close(fdr))
> diff --git a/tools/testing/selftests/net/psock_snd.sh b/tools/testing/selftests/net/psock_snd.sh
> index 1cbfeb5052ec..b6ef12fad5d5 100755
> --- a/tools/testing/selftests/net/psock_snd.sh
> +++ b/tools/testing/selftests/net/psock_snd.sh
> @@ -92,4 +92,9 @@ echo "raw gso max size"
>  echo "raw gso max size + 1 (expected to fail)"
>  (! ./in_netns.sh ./psock_snd -v -c -g -l "${max_mss_exceeds}")
>  
> +# test drops statistics
> +
> +echo "test drops statistics"
> +./in_netns.sh ./psock_snd -D
> +
>  echo "OK. All tests passed"
> -- 
> 2.52.0
> 


