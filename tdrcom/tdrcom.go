package tdrcom

import "errors"

type Message interface {
	Init()
	GetBaseVersion() uint32
	GetCurrentVersion() uint32
	Pack(cutVer uint32) ([]byte, error)
	PackTo(cutVer uint32, w *Writer) error
	Unpack(cutVer uint32, data []byte) error
	UnpackFrom(cutVer uint32, r *Reader) error
}

func Marshal(m Message, cutVer uint32) ([]byte, error) {
	if m == nil {
		return nil, nil
	}
	if cutVer == 0 {
		cutVer = m.GetBaseVersion()
	}
	return m.Pack(cutVer)
}

func Unmarshal(data []byte, m Message, cutVer uint32) error {
	if m == nil {
		return errors.New("tdrcom: Unmarshal called with nil message")
	}
	if cutVer == 0 {
		cutVer = m.GetBaseVersion()
	}
	return m.Unpack(cutVer, data)
}
