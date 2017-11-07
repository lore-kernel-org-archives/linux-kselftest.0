From: dave.hansen at intel.com (Dave Hansen)
Date: Tue, 7 Nov 2017 14:47:10 -0800
Subject: [Linux-kselftest-mirror] [PATCH v9 00/51] powerpc,
	mm: Memory Protection Keys
In-Reply-To: <20171107223953.GB5546@ram.oc3035372033.ibm.com>
References: <1509958663-18737-1-git-send-email-linuxram@us.ibm.com>
 <87efpbm706.fsf@mid.deneb.enyo.de>
 <20171107012218.GA5546@ram.oc3035372033.ibm.com>
 <87h8u6lf27.fsf@mid.deneb.enyo.de>
 <20171107223953.GB5546@ram.oc3035372033.ibm.com>
Message-ID: <8b970e5b-50e6-bcc1-e8d3-6e3aa8523f55@intel.com>

On 11/07/2017 02:39 PM, Ram Pai wrote:
> 
> As per the current semantics of sys_pkey_free(); the way I understand it,
> the calling thread is saying disassociate me from this key.

No.  It is saying: "this *process* no longer has any uses of this key,
it can be reused".
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
