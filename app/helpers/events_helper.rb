module EventsHelper

  def event_port_number(event, type)
    if event.tcp?
      return event.tcp.send(:"tcp_#{type.to_s}")
    elsif event.udp?
      return event.udp.send(:"udp_#{type.to_s}")
    else
      nil
    end
  end


  def protocol(event)
    if event.tcp?
      :tcp
    elsif event.udp?
      :udp
    elsif event.icmp?
      :icmp
    else
      nil
    end
  end

  def session_id(event)
    "#{event.ip_src}_#{event.ip_dst}_#{event.signature.sig_id}"
  end


  def source_conditions(event)
    data = { column: :source_ip }

    return data.merge( operator: :isnull ) unless event.ip

    data.merge( operator: :is, value: event.ip_src.to_s )
  end

  def destination_conditions(event)
    data = { column: :destination_ip }

    return data.merge( operator: :isnull ) unless event.ip

    data.merge( operator: :is, value: event.ip_dst.to_s )
  end
end
