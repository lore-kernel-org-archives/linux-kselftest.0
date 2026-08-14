Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8093486B89
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723482; cv=none; b=OO9ZFPJ4QF8HyjO2/4eMBszDG//vRHQPWWGxfVS4BtDq6Wtt1FPUOalb0O4XSyLuKipIYEC0FGEjiK5uVH7zLk2fer+xkcvtRRJ/7DTp3RCOdm03LQDxaoTUtL9GkMLOmBEd6zRMPeKFl5gTOVbVYXJ8tpkw36RkJVWUUTxyPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723482; c=relaxed/simple;
	bh=52qCRrZb2SMRCcmFeD6ZAbxvhqKc5jQN4x92ylGefnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YliT/tLTwR3JdHhXx5W1DZZerri3BmEBhJ4NpAWhCIyNoVUOKkLheKrqhjNV08XIIBIBnflgo5ddBbanZ0HPa6uaSz2RvgEcYJK2d7FQKntvP+Jp8FyaPPd3o8VW0pkHK3q3NcIf7Rjs46Ap22ssUI4SCDMY91SaUf92GMPTyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=RNqflWah; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="RNqflWah"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6acc2a10023so669393eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1786723478; x=1787328278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZdEAU+RA4hG/xm/Q4y+B1YPvOJHTrAQedhhdFxab1c=;
        b=RNqflWahBCsLWj3fGqUb+K1nVtQHHr9HkS9nM46NhzOtrQyR0qyOGvp8zeOtClpOJS
         e29CEzcZ6WYvAXBfD2Q4qmam0srSrHzIo2pxywSrm5cCPU+8FX+kARdtBdJQ+SCNVh7p
         uw+bFzySZAd3HWHshPgl+Jf/pyfMvZ/FN32SEWjpxeZCpSE34OyqQtjqVyJAgC4s0Qth
         qO0K8VqxrIPxz0qCmjatWqLsjfj9MKQ9m3aVVkN7uywSLGvdUmE4ze3/85Bw7Cc5avub
         C2JrBVEOK29yRU7Gse0dS2ATFVgSda+nTkZ71sgp08JZCiQ8urEZla9J+ZPQgQYILFUT
         HPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723478; x=1787328278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZdEAU+RA4hG/xm/Q4y+B1YPvOJHTrAQedhhdFxab1c=;
        b=YdsII3Gw/rtsDVFAn2L7y+hW/GzmUPaQyPA0hpnhXB2RdKI5MtiPTeeK+bfc4RY5v4
         aFByOvl09lyyt05rwCsuplbLlo6mpuGv56eUPS55VVISqsBZIGuX8RzASTjB0Wp40WLl
         bQr7rna8m9i8IsAGOviJo/jwxuJcGdqG3zvmCq2OMHxP1VqbKdS8mVCl0tyZ8sYFHNJT
         hun3mZ8o4ZG+xXuvdOuVvcP4+3rv4L1HYsLGJARBW33dtIPi5ndmBxUFifgyxK8BC5BT
         QiOgiQdAcPTmO4g+hkRtoFVYahApxVo0b9IePQ0rZJ2V3utQrw7DVeQKvzb73P9tFNJF
         eD8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3HZgDikzTBKj2Cd6FJLjO3PlDfET/dyTzBaj16JxQAg5fbyCnITmHO3M9vgaJw2ZQxogr0t4oSO2hBUHXna0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAvQt06EZyejXr+vh0elZsUm+0ORvy9fy2HV4Ntpibg1nPhCKy
	tPth1SzHViUxuwZv5kexEZMdawdmjVbI93d4u6wgoaHT0H/kYNV1jAeNHgMuQCot3EI=
X-Gm-Gg: AR+sD13V4+92M4OOFoDUdIu0UAru2H0YBe3+flS2C5YUQ945flVhDSl9xQ1hJX6Tthu
	SmRFICww++vIgrtIm+quWDoBNmEy9JEemh6+MAMsSrzy/CUWv/v47YoPpnCbBYjUGVmgfb9LqIE
	3z0J+h5A/EM/qJj7XmxvNO5Y+OIorvrnuOK04gJjdLgRGj+veSsALfsaRtyUrktIL428TjJ1QqU
	WrD7QPR1qyMSH0PNABUriR1Jogs0fUTorIBRQiBb03WvTEW1Y2X19KefL8wVyXFo/J9HfP0ueNM
	w/Okt5OrFCibWNtOjW3O+FInIKSSWO7/hb/vGKksLGzo8n6AP5dujEA4aXII9qRLnFLn64bqQey
	Pi2RAhspNB1UzNCRbK6nGn3KYcwqQb5kV2jdlcbm5AVPu4+4BDhl/qh86KYCcGjq0AnzF5WJahX
	mlyOFEPiRKAqoRQ1WkzXDuRLJcyOPTBUAdOCKQe783Hs/XcNlggiFJi4wyzp1rpdEHDGhC/YduM
	OMCme56btyHvEyTT13rrbZvfpX+XMa8Os6E2oBCrGbFdxJzRPcBljST+0qk+2gvosSnXppX
X-Received: by 2002:a05:6820:1513:b0:6b0:ac70:f741 with SMTP id 006d021491bc7-6b0d690bfc2mr5364333eaf.28.1786723478104;
        Fri, 14 Aug 2026 09:04:38 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::4:a11e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0db240128sm2104198eaf.13.2026.08.14.09.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:04:37 -0700 (PDT)
Message-ID: <7e1a7fab-ea77-4373-ba7d-a3ce5aa73ba1@davidwei.uk>
Date: Fri, 14 Aug 2026 09:04:35 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] selftests: net: add multithread client
 support to iou-zcrx
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260814012348.46958-1-juanlu@fastmail.com>
 <20260814012348.46958-5-juanlu@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260814012348.46958-5-juanlu@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-13 18:23, Juanlu Herrero wrote:
> Add pthreads to the iou-zcrx client so that multiple connections can be
> established simultaneously. Each client thread connects to the server
> and sends its payload independently.
> 
> Introduce the -t option to control the number of threads (default 1),
> preserving backwards compatibility with existing tests.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   .../testing/selftests/drivers/net/hw/Makefile |  2 +-
>   .../selftests/drivers/net/hw/iou-zcrx.c       | 35 +++++++++++++++++--
>   2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 78bb0169350b2..37023ba580de7 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -91,5 +91,5 @@ include ../../../net/ynl.mk
>   include ../../../net/bpf.mk
>   
>   ifeq ($(HAS_IOURING_ZCRX),y)
> -$(OUTPUT)/iou-zcrx: LDLIBS += -luring
> +$(OUTPUT)/iou-zcrx: LDLIBS += -luring -lpthread
>   endif
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index 9b62fd0703e61..f793a6c04e412 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -4,6 +4,7 @@
>   #include <error.h>
>   #include <fcntl.h>
>   #include <limits.h>
> +#include <pthread.h>
>   #include <stdbool.h>
>   #include <stdint.h>
>   #include <stdio.h>
> @@ -85,6 +86,7 @@ static int cfg_send_size = SEND_SIZE;
>   static struct sockaddr_in6 cfg_addr;
>   static unsigned int cfg_rx_buf_len;
>   static bool cfg_dry_run;
> +static int cfg_num_threads = 1;
>   
>   static char *payload;
>   
> @@ -379,7 +381,7 @@ static void run_server(void)
>   		error(1, 0, "test failed\n");
>   }
>   
> -static void run_client(void)
> +static void *client_worker(void *arg)
>   {
>   	ssize_t to_send = cfg_send_size;
>   	ssize_t sent = 0;
> @@ -405,12 +407,36 @@ static void run_client(void)
>   	}
>   
>   	close(fd);
> +	return NULL;
> +}
> +
> +static void run_client(void)
> +{
> +	int total_conns = cfg_num_threads * cfg_num_threads;
> +	pthread_t *threads;
> +	int i, ret;
> +
> +	threads = calloc(total_conns, sizeof(*threads));
> +	if (!threads)
> +		error(1, 0, "calloc()");
> +
> +	for (i = 0; i < total_conns; i++) {
> +		ret = pthread_create(&threads[i], NULL, client_worker, NULL);
> +		if (ret)
> +			error(1, ret, "pthread_create()");
> +	}
> +
> +	for (i = 0; i < total_conns; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	free(threads);
>   }
>   
>   static void usage(const char *filepath)
>   {
>   	error(1, 0, "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port> "
> -		    "-l<payload_size> -i<ifname> -q<rxq_id>", filepath);
> +		    "-l<payload_size> -i<ifname> -q<rxq_id> -t<num_threads>",
> +		    filepath);
>   }
>   
>   static void parse_opts(int argc, char **argv)
> @@ -428,7 +454,7 @@ static void parse_opts(int argc, char **argv)
>   		usage(argv[0]);
>   	cfg_payload_len = max_payload_len;
>   
> -	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:d")) != -1) {
> +	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:dt:")) != -1) {
>   		switch (c) {
>   		case 's':
>   			if (cfg_client)
> @@ -469,6 +495,9 @@ static void parse_opts(int argc, char **argv)
>   		case 'd':
>   			cfg_dry_run = true;
>   			break;
> +		case 't':
> +			cfg_num_threads = strtoul(optarg, NULL, 0);
> +			break;
>   		}
>   	}
>   

Reviewed-by: David Wei <dw@davidwei.uk>
