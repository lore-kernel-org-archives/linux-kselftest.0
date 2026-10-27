Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119236;
	b=YqLiBlWAHGutKnQI0mroXzk7JXNEJTQdfLFN21mRcOqjY1jmeNZE9NDMj3OWyaql2wuQ
	 WUuyp0RJgYBocs49FJNHq+c9x8skropMYxA45KpQ3oNgsjCoyQr7doxIMAQh+maa4Umjo
	 jasQySbKdn3ixB6HZr1RCyxHh2A1xkRqJm0V73trvNAHSeFnsuyZn37fiatzLEuHQnSZY
	 ph0kwOi9UdmbkGhmSDKsqTPKXBZlwjMn6yFKU7ypfCcfOIiLFZJqZjSsMnduGQTQrfMgy
	 XSwaRga5mYQs5SOBYz9rafw20s1uqSOOl3MCw0Wko5I3VCxp056N2UscKXoSBSrPnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
	b=EXEeLqhpUsm9tXSdT12lF5icPPsmsoN5t4TB5En5kQiNxMioombrA3arovK1BJIo5ORK
	 88Vzcqo6oklE+NlsLWLf/xkvluQd4Sge/yvq3VihsLveeVVX38xJX8zlJI4689U/zxeQm
	 gkkThpIgNmJGQET335OegzrXAqH/ZN9jP8waGA4CoGNO7MLDi1qc+O5N4kKDdh3kybRj+
	 CwVSoWUhk1uqn1yUK5JEz2wVbZx0XXcObQddfx2v1UOdCDObtKZdVd9eKbAAY+qI/rtuf
	 iklVZSyMj+9niptHRjLRy7dpsNGuFXcOv3U750QNBpxGj2/XSg+1vdpzuVUcZ6eU+eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0188606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0188606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso110839a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119235; x=1793724035; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=B9pgIkENP1nZt32P35HL6R0QxS18tatDUdKB8+Mex6frfRryvJ9HnZJ7yNzfYATxhk
         mTrYNth1sJ7pCfjLGBXbFdbG3yuaxupUx6NbUaEWi/y1Uy1q26SBQQf/tSjOD1IJGvsz
         l/pr3UYOepZQugq4IDXYNoHxly1ZnTRA2eYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119235; x=1793724035;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=RqIqAlmcxDBmt/xxiYYWvNS5VBPnm7I43H6mJ4uB+Fl+MTRTrVIv3r9Uut1yONptz/
         aduo+9x44RMYNsz1DGMysYpzR7+obuX3JsGtxYwmZZhoxmhgsrmCM/k5JfbWFpaIyopP
         oAkJAZrlY+zxgQQB/uWiUrFFOdDFEJWfCamt8fgnaJpy4j5hAE0xygMEzei0wDQOhOla
         QjjbtwBB6MQak4BAKtTt9Y3pfEJTy9y7+FTZgszM4KUifwKOHtv1BJyGARMOnulvriWy
         Ufhoaj6hLNgtLQ8AnCDTiisf0Y7q6caqQPD5Sl250iZV1Vtxq1qtOzq+iiC6+itvn0Ap
         RuwA==
X-Forwarded-Encrypted: i=1; AKwUvBz/qQ3OVq7Nf1AoFUAEKqasj/3Vf4y4h/NOWaA7VHt0G89K8gdLAb2aBDodkneSKhaKZQZZ/4wdO0HxmFplkF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVB4uBCc4u7VE2WSXWSfdyZhFDOXlJWRDG7Vu3MXLlsuMUqlRD
	JoVFzH/Wu0aZD8mqdPX1/E+0sJDqqSDwTCzEUaMid6tmbyLNqG8+8FeVmKmYjQUpiyY=
X-Gm-Gg: AYBFou30QZ4XBFU5CflHybce+P6gsn2nagAne775E0mpm0lh+F3cd+ZApq46XYebMP7
	XoYJ+SoQ2/MPPyT45em4q4ZhazZqxQUx59UpJb1STTlL1v6ypMg0pbf/D8Mk0bEV3G7w7PSy9oi
	xsNtKd8euGOu8L03hw2mzHK6uuUh7KLllUbWETMODN1f8sXLzchduP9eCPWP2kq56WexLgXY8rM
	VeT2w4uLW+VqTGA89ZUlCP/XZBa7sleU+JdZawE9aPne0j0tK50NZP996nUuCHvtKi/u3OJV94e
	ri0wGFd1+dfi342f0lAixUvAr/vHYA4UfPNC3sfdFyx6lb/VZpUt9PuJQf4BRaqx8E6ORmR3XKM
	qcJ4o1veTbZBON70UNvURMW8AbVkodCyFzc8HZytyWSSYet9bRiMSLmv32BOwnAldd/A7yHs7CR
	Ggxd5Kf7GuiqCL2Q1gDnpHFujKr1VHDcO1TFs/U93441hWDAwmxK7NvflUpEsGMqAUh5gGFwpCR
	d3j/zld9NoENMFqWMqGn9Pv25otYqo6doLbkCzrk2SQJbPpeultSegCbcrOUMyPwReRF9CEAT4e
	YCanMn7bhoQfSMrHtyMfoZ3KXEMKk0TlSlqG4EZpxcnCdk9p/AjTcD+SvCXxFRKhEaFUYQIQDYs
	oLOjFMi+XaiaYQppz+iqGFnx/WpbFxQUO8HAy0fFTZ9aWWb+O0nDjrIEhcYH6AQkO3QnnEc2UPA
	==
X-Received: by 2002:a17:90b:528a:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3adead57da9mr8291010a91.15.1793119235223;
        Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066d631sm4569992a91.17.2026.10.27.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:40:34 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:40:32 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <auDUAN9xAQRQhnCo@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
 <auC7_5XYr31fimvL@gremlin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7_5XYr31fimvL@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Lorenzo Stoakes (ARM) writes:
>Sorry, in mm we require commit messages. Even for tests :)

Sure thing, I'll add one.

>On Tue, Oct 27, 2026 at 07:43:25PM +0800, Chris Down wrote:
>> Signed-off-by: Chris Down <chris@chrisdown.name>
>> ---
>>  .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> index ea75ad537620..83b4fadfbfe7 100644
>> --- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> +++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>
>Why on earth does 'mseal_system_mappings' have its own directory...??
>
>Ugh I don't know how I let this stuff go on the original series :/
>
>Please, for the love of all that's sacred, move these tests over to
>tools/selftests/mm/. This is an mm feature, for our sins...
>
>You can do the move as a prerequisite patch in the series.

Will do, I'll make the move the first patch.

>(And, again, I really do insist on your change doing some cleanup here as
> well rather than extending this stuff.)

Yep, see my reply to 1/3.

>> @@ -10,6 +10,7 @@
>>  #include <unistd.h>
>>  #include <string.h>
>>  #include <stdbool.h>
>> +#include <sys/mman.h>
>>  #include <sys/utsname.h>
>>  #include <zlib.h>
>>
>> @@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
>>  	EXPECT_EQ(expected, sealed);
>>  };
>>
>> +static bool find_vdso(unsigned long *start, unsigned long *end)
>> +{
>> +	char line[MAX_LINE_LEN];
>> +	bool found = false;
>> +	FILE *maps;
>> +
>> +	maps = fopen("/proc/self/maps", "r");
>> +	if (!maps)
>> +		return false;
>> +
>> +	while (fgets(line, sizeof(line), maps)) {
>> +		if (strstr(line, "[vdso]") &&
>> +		    sscanf(line, "%lx-%lx", start, end) == 2) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	fclose(maps);
>> +	return found;
>> +}
>
>There's shared code for this kind of thing, please don't duplicate a
>/proc/self/maps thing if unnecessary. Also there's a nicer ioctl interface for
>all this.
>
>See vm_utils.[ch].

Oh thank you! I will use that.

>I mean arguably this is an mremap test that belongs with mremap? I guess
>debatable...

Hmm, I'd lean towards keeping it with the sysmap test, since it's really 
testing that the seal is enforced on these mappings rather than anything about 
mremap() itself, but I don't feel strongly if you insist, just let me know.

>This all just seems like work that should have been done in the past when this
>feature was proposed, and doesn't depend on your changes at all AFAICT? Maybe I
>missed it though.
>
>Valuable in itself, but probably worth sending separately as a result? Otherwise
>it's a little disconnected from the actual change you're making.

Yeah, it doesn't depend on it. I can send it separately on top of the move if 
you like, I just don't like touching things without tests where possible.

Thanks for the review!
