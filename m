From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:34:52 -0700
Subject: [PATCH v12 22/22] selftests/vm: Fix deadlock in protection_keys.c
In-Reply-To: <1519264541-7621-23-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-23-git-send-email-linuxram@us.ibm.com>
Message-ID: <0c82a148-3f10-66f4-a7d7-cace557ff038@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> From: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
> 
> The sig_chld() handler calls dprintf2() taking care of setting
> dprint_in_signal so that sigsafe_printf() won't call printf().
> Unfortunately, this precaution is is negated by dprintf_level(), which
> has a call to fflush().
> 
> This function acquires a lock, which means that if the signal interrupts an
> ongoing fflush() the process will deadlock. At least on powerpc this is
> easy to trigger, resulting in the following backtrace when attaching to the
> frozen process:

Ugh, yeah, I've run into this too.

Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
