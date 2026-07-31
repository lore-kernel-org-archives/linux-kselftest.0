Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2F3AEB5D
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501691; cv=none; b=b5gLpPgqitSqgY8YzWFN9b3GutMUCYTkvd4+b3MmpPuNZbkJ2gyu7jBPNc06CPesj4uq/y+gscE9a3r+JLJoJVqrWbH8DJzo7565VbKh/Ykr/gxyDkMRFOznMlgnAXTD1eVcCAgWhfG9M9gISRhBnGxSttRjeJhobCCi4WjtGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501691; c=relaxed/simple;
	bh=keIsujryx3Uee0mJit7AKr9nN0ssqKTbSC5x1osOq28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEGznUgWsobVf7dst9b6Xhhx1igcRuXterCa8epMFaZMDj5ePn5BPEhwsc38yvjTCVQNGvVsnTgKMhdpQ2gFRj85Ukn6PgdfyIc71vt2/VZrq9rxRGANgH+HkRs4S58vVdSzqLL35aRUpKHypYFx8AqOAvJgjfy5vTJaWfoIKdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6nafXas; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6nafXas"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9083f928b60so4603926d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785501689; x=1786106489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR51AZn/bvW2dwxRSuHfDMRFFtyWMfnouj4EfaRrzZs=;
        b=i6nafXasKXLG6nPUYRVBnBIWDGnj99S2pyfmAT2SMCWXhLDV8XaYrouc2Ua2i5vimd
         UUXEjqOji+58UkOqKxSbvC33VFKvxw7L4sGbacPAUAIXlq80E19WLzwA8qQSPeKkl2r3
         Z9XqISG1mtM7UD2DkFdMqLsP8GKgKzA4FQXBHQ/65SNEeMqkq9dpzySYFRhCkLpiKTfu
         ODht7ZlfQdd1TZGhwUwP/AR8ys9xgWE3iHFC1f2kHvvhkYNIsLfG5clzN29EaXwMEkls
         JYIOd1M+Gu+c/ZQzbbF3RPRyK9jEqIQ80Vzk20y6O2vdK7enadd2F4bGmXY/EJFU3KIq
         e9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501689; x=1786106489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR51AZn/bvW2dwxRSuHfDMRFFtyWMfnouj4EfaRrzZs=;
        b=UNQl8/MeIpRYsEVJ+dGEvW0UMKKXK1MvbXCwxd1tywZYJ7LECcI7gLFqd0pS9PocIR
         VOYDYbkEfGJSHDHW+zFCCYv7yfRAC5HGEvB3+60wz595kYFXYrDn5ffgKkbD3mSgvUq5
         J/0Z98duxbOn87f/VkbAvgVU00dh/lX/tQchiaXgL5vh8G4Vd15GDBmmhPa7pB07orZV
         2lUiLBFVmyRT6UutkGSCo77ATTYe+gZjjYxX8N3+dEvrpl/815O7fmRhaEwzXrFsuDCS
         k6obAHL4glCAPh0HBedpAYXYKKUMuQr1N2jyANAn81Zk6tVh3hkyAYBVn0OFkhmkVVJJ
         Dhrw==
X-Forwarded-Encrypted: i=1; AHgh+RqGCT7+wuJ6KVRaSJ/DixYMRasBt+r56GAIRegOksz2tCsDEttT1spOIE/DRjxxILttfEIJlPiduGg9PhKciLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9uHSB3qGuEx+1/n20FpMneDaPDQuQZfhE4hEozKVSF90qk7f
	Qke2wLt2TM3lnAFS2dewLYKxYoB8VmFeVjbzemVmVEomsBjzaAl777Vb
X-Gm-Gg: AR+sD12MLRqCM7G7Xk4J4bYrCEfhvELsOxvb11vB+CglJFNFJ+PupHPh9YuSlzMiXCX
	U0N4r6KexvWHklUn6vgH2jiEUjSZAXseXpgL1PqWyRyXUfLTUAH/a5amJpnFSUdk+L1SRc8V50M
	Jkvxv5SvgPM23gJyrR0ogP4ghL597WxnW/nE1YVI3WWZCEzbBdVGJEvJNJXqQLjnenZfW9Jgqvp
	YEAajgJbyqboPqN0Gz6Vtvf+/Vv/mi1w7fL9czKB9g7S2ixUcPUKs9JgkZWGVLmCwmv1Di8OUn5
	E4uiUqa2MhfG6XOUj779ha9cRnkcD8tpr7weMbjuWtLf7jJLMFyAg0YAnvKtMeL3qjyEOVhRupt
	oxub5F/Px9vSQnJBjzhA7jWNSMxcyRuneO9BbK3exkIY01S4iuge5aXqpL2fZwKHlHd8LmEd5CH
	N7VkF5pbUSNsUM4sSLFyLD5m1+/VOYgy+Y5K/fFd+jSgEpDNCw7DZ8SXGydiFCI3de1QYFnlx0u
	tS9saE3IpjwQYlFrqJN0j99EvK+tjY=
X-Received: by 2002:a05:6214:3f85:b0:8ef:91c5:8edb with SMTP id 6a1803df08f44-9084218e7a2mr38156866d6.10.1785501688541;
        Fri, 31 Jul 2026 05:41:28 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1145:4:4e58:3e50:ad11:4e7a? ([2620:10d:c091:500::4:2e2b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435dfa6dsm9313106d6.33.2026.07.31.05.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:41:27 -0700 (PDT)
Message-ID: <0d72c5b2-6d4c-40d4-8cbe-8cd95d61a230@gmail.com>
Date: Fri, 31 Jul 2026 08:41:26 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/13] net/mlx5e: psp: Add an rx_decap steering
 table
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Alexei Lazar <alazar@nvidia.com>, Boris Pismenny <borisp@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>, Chris Mi <cmi@nvidia.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Doruk Tan Ozturk <doruk@0sec.ai>,
 Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Jacob Keller <Jacob.e.keller@intel.com>, Jianbo Liu <jianbol@nvidia.com>,
 Kees Cook <kees@kernel.org>, Lama Kayal <lkayal@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
 Mark Bloch <mbloch@nvidia.com>, Patrisious Haddad <phaddad@nvidia.com>,
 Raed Salem <raeds@nvidia.com>, Rahul Rameshbabu <rrameshbabu@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Stanislav Fomichev <sdf.kernel@gmail.com>
References: <20260730091756.2543777-1-tariqt@nvidia.com>
 <20260730091756.2543777-10-tariqt@nvidia.com>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20260730091756.2543777-10-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/30/26 5:17 AM, Tariq Toukan wrote:
> +static
> +void accel_psp_fs_rx_decap_ft_destroy(struct mlx5e_psp_fs *fs,
> +				      struct mlx5e_psp_rx_decap_table *decap)
> +{
> +	int i;
> +
> +	accel_psp_fs_del_flow_rule(&decap->unsupported_rule);
> +	for (i = 0; i < MLX5E_PSP_NUM_SUPPORTED_VERSIONS; i++)
> +		accel_psp_fs_del_flow_rule(&decap->rule[i]);
> +	if (decap->reformat) {
> +		mlx5_packet_reformat_dealloc(fs->mdev, decap->reformat);
> +		decap->reformat = NULL;
> +	}
> +	accel_psp_fs_dealloc_modify_hdr(fs->mdev, &decap->modify_hdr);
> +	accel_psp_fs_destroy_flow_group(&decap->drop_group);
> +	accel_psp_fs_destroy_ft(&decap->ft);
> +}
> +

[...]
> +static int accel_psp_fs_rx_reconfigure(struct mlx5e_psp_fs *fs,
> +				       bool decap_wanted)
> +{
> +	bool decap_supported =
> +		MLX5_CAP_FLOWTABLE(fs->mdev,
> +				   flow_table_properties_nic_receive.reformat_del_psp_transport);
> +	bool decap_enable = decap_wanted && decap_supported;
> +	struct mlx5_flow_destination dest = {};
> +	int err;
> +
> +	/* Create the decap table if needed. */
> +	if (decap_enable && !fs->decap.ft) {
> +		err = accel_psp_fs_rx_decap_ft_create(fs, &fs->decap);
> +		if (err) {
> +			mlx5_core_warn(fs->mdev,
> +				       "Failed to create PSP decapsulation rules (err %d), HW GRO for PSP unavailable",
> +				       err);
> +			decap_enable = false;
> +		}
> +	}
> +	if (decap_enable == fs->decap_enabled)
> +		return 0;

An llm is complaining that fs->decap_enabled is not set to false when 
the decap table is destroyed with accel_psp_fs_rx_decap_ft_destroy(), 
which would cause problems after doing a psp_dev_ops::set_config() down 
and up.

I'm not sure if this is legit, but figured I would flag it as it seems 
plausible and would be easily reachable by a user.
